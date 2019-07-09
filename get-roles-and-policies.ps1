Param(
    [Parameter(mandatory=$true,Helpmessage="The AWS credential profile to use for authentication")] [string] $profile
   )

Try {  $alias = Get-IAMAccountAlias -ProfileName $profile }
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

#if teh direcotry already exists, rename it
$epoch = get-date -Uformat %s
if (test-path $alias){rename-item -Path $alias -NewName "$alias.$epoch"}

#Create Directories to hold our output code
$codepath = new-item -path ".\" -Name $alias -ItemType "directory"
$policypath = new-item -path ".\$alias" -Name "policydocs" -ItemType "directory"

$policytf = get-content ".\policy_template.hcl"
$roletf = get-content ".\role_template.hcl"
$attachtf = get-content ".\attach_template.hcl"


#capture all the local policies
$policies = Get-IAMPolicyList -Scope "local" -ProfileName $profile |Where-Object -FilterScript {$_.AttachmentCount -gt 0}
$policies|ForEach-Object {
    $version = (get-IAMPolicy -PolicyArn $_.arn -ProfileName $profile).DefaultVersionId
    $policy=Get-IAMPolicyVersion -PolicyArn $_.arn -VersionId $version -ProfileName $profile
    Add-Type -AssemblyName System.Web
    $policydoc = [System.Web.HttpUtility]::UrlDecode($policy.Document)
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


$roles = Get-IAMRoles -ProfileName $profile
$roles|ForEach-Object {
    $role = get-IAMrole -RoleName $_.RoleName -profilename $profile
    if (!($role.path -match "/aws-service-role/") -and !($role.path -match "/core/") ){
        Add-Type -AssemblyName System.Web
        $assume =  [System.Web.HttpUtility]::UrlDecode($role.AssumeRolePolicyDocument)
        $rolename = $($_.RoleName).replace("+","-")
        $terraform =$roletf.replace("ROLE", $rolename).replace("ASSUME",$assume).replace("PATH",$role.path)
        $tf_file = "$codepath\role-$rolename.tf"
        $i=0
        write-host "ROLENAME: $($_.rolename)"
        Get-IAMAttachedRolePolicyList -RoleName $role.rolename -profilename $profile |ForEach-Object{
            # + character causes errors in Terraform, repalcing with -
            Write-Host "     $($_.PolicyARN)"
            $policy = $($_.PolicyArn).replace("+","-")
            $attachtfn = $attachtf.replace("ATTACH","$rolename$i").replace("ROLE",$rolename).Replace("POLICY",$policy)
            write-host "          $attachtfn"
            $terraform = $terraform + $attachtfn
            $i++
        }
        Out-UTF8NoBOM -File $tf_file -Content $terraform 
    }
}
    


