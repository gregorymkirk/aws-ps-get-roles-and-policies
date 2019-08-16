Param(
    [Parameter(mandatory=$true,Helpmessage="The AWS credential profile to use for authentication")] [string] $profile
   )
Set-AWSCredential -ProfileName $profile

Try {  $alias = Get-IAMAccountAlias  }
catch { Write-Host "No alias returned for credentials $profile, is this profile valid?"
        Break
        }

Function Out-UTF8NoBOM {
#accepts a string containing content, and an absolute path & filename (e.g c:\mydir\myfile.txt), and writes a UTF-8 file with no BOM>
#PowerShell by default includes the BOM character at the start of the file, which many programs (like Terraform) do not accept.
#We are NOT checking for filename compliance (e.g reserved words, reserved characters etc) or valid paths. 
#Ref: fixing the BOM prepended to the win UTF8 file https://stackoverflow.com/questions/5596982/using-powershell-to-write-a-file-in-utf-8-without-the-bom
    Param ( [string] $Filename,
            [array] $Content
            )
 
   $File = New-Object System.Text.UTF8Encoding $False
   [system.IO.File]::WriteAllLines( $Filename, $Content, $File)
 
}

Add-Type -AssemblyName System.Web

#if the direcotry already exists, rename it
$epoch = get-date -Uformat %s
if (test-path $alias){rename-item -Path $alias -NewName "$alias.$epoch"}

#Create Directories to hold our output code and policy docs
$codepath = new-item -path ".\" -Name $alias -ItemType "directory"
$policypath = new-item -path ".\$alias" -Name "managedpolicydocs" -ItemType "directory"
$assumerolepolicypath = new-item -path ".\$alias" -Name "assumerolepolicydocs" -ItemType "directory"
$inlinepolicypath = new-item -path ".\$alias" -Name "inlinepolicydocs" -ItemType "directory"


$policytf = get-content ".\policy_template.hcl"
$roletf = get-content ".\role_template.hcl"
$attachtf = get-content ".\attach_template.hcl"
$inlinetf = get-content ".\inline_template.hcl"


#capture all the user managed  policies
$policies = Get-IAMPolicyList -Scope "local" |Where-Object -FilterScript {$_.AttachmentCount -gt 0}
$policies|ForEach-Object {
    $version = (get-IAMPolicy -PolicyArn $_.arn ).DefaultVersionId
    $policy=Get-IAMPolicyVersion -PolicyArn $_.arn -VersionId $version 
    $policydoc = [System.Web.HttpUtility]::UrlDecode($policy.Document)
    # + character causes errors in Terraform, replacing with -
    $policyname = $($_.PolicyName).replace("+","-")
    $policyfile = "$policypath\$($_.PolicyName).json"
    Out-UTF8NoBOM -File $policyfile -Content $policydoc

    $doc = "$($_.PolicyName).json"
    $path = "$($_.path).json"
    $description = "$($_.description).json"
    $terraform =$policytf.replace("NAME", $policyname).replace("POLICY_DOC",$doc).replace("PATH",$_.path).replace("DESCRIPTION",$_.Description)
    $tf_file = "$codepath\policy-$policyname.tf"
    Out-UTF8NoBOM -File $tf_file -Content $terraform 
 
}

#List all the roles
$roles = Get-IAMRoles 
#interate thought each role
$roles|ForEach-Object {
    $role = get-IAMrole -RoleName $_.RoleName 
    #ignore aws service roles and the TFS core roles
    if (!($role.path -match "/aws-service-role/") -and !($role.path -match "/core/") ){
        $assume =  [System.Web.HttpUtility]::UrlDecode($role.AssumeRolePolicyDocument)
        $rolename = $($_.RoleName).replace("+","-") # clean up the role name so terraform doesnt; reject it
        $assumerolepolicyfile = "$assumerolepolicypath\assume-$rolename.json"
        # write out the assume role policy to a file
        Out-UTF8NoBOM -File $assumerolepolicyfile -Content $assume
        #build out the terraform code for the role.
        $terraform = $roletf.replace("ROLE", $rolename).replace("ASSUME","assume-$rolename.json").replace("PATH",$role.path)
        $tf_file = "$codepath\role-$rolename.tf"
        write-host "ROLENAME: $($_.rolename)"

        #get ane iterate thought any inline policies defined for this role
        $j=0
        $RolePolicyList = Get-IAMRolePolicyList -RoleName $role.rolename  
        if ($RolePolicyList.count -gt 0 ){
            $RolePolicyList|ForEach-Object{
                #capture each inline policy, write to a json file and add the code to the role tf file
                $policy=Get-IAMRolePolicy -PolicyName $_ -RoleName $role.RoleName 
                $policyname = $($_).replace("+","-")   # + character causes errors in Terraform, replacing with -
                $policydoc = [System.Web.HttpUtility]::UrlDecode($policy.PolicyDocument)
                $policyfile = "$inlinepolicypath\inline-$rolename-$policyname.json"
                # write out this inline policy to a file
                Out-UTF8NoBOM -File $policyfile -Content $policydoc
                $inlineltfn = $inlinetf.replace("ATTACH","$rolename$j").replace("ROLE","$rolename").replace("POLICY","$policyname")
                $terraform = $terraform + $inlineltfn
                Write-Host "     Inline:  $policyname"
                $j++
            }
        }

        $i=0
        $AttachedRoles=Get-IAMAttachedRolePolicyList -RoleName $role.rolename  
        if ($AttachedRoles.count -gt 0 ){
            $AttachedRoles|ForEach-Object{
                # + character causes errors in Terraform, repalcing with -
                Write-Host "     $($_.PolicyARN)"
                $policy = $($_.PolicyArn).replace("+","-")
                $attachtfn = $attachtf.replace("ATTACH","$rolename$i").replace("ROLE","$rolename").Replace("POLICY","$policy")
                $terraform = $terraform + $attachtfn
                $i++
        }
    }
        Out-UTF8NoBOM -File $tf_file -Content $terraform 
    }
}
    