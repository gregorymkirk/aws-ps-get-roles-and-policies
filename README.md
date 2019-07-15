##Prerequisites:
  1) Powershell (already installed on windows laptops, available as powershell core for Linux/OSX)
  		(https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-6)
  2) AWS Tools for Powershell installed
  		( https://aws.amazon.com/powershell/)

##Execution

	1) Clone the repo, or copy the script and hcl template files to a directory your machine.
	2) On windows machines, ensure that powershell script execution is enabled.
			You can check the execution policy with the following command:
			"Get-ExecutionPolicy -List"
	 If necessary run the commands:  
			"Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine
			 Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine"
	If machine or user policies are set to values other than Undefined or Unrestricted you will need to contact your Widows adminstrator to request the change, as these indicate the policy is set by an Active Directory Group Policy Objec(GPO).
	3) .\get-roles-and=-policies.ps1 -profile <AWS_credential_profile_name> (if you do not specify a profile on the command line the script will prompt for one.)
	4) The script is designed to exclude aws service roles, AWS managed policies, and the TFS core roles and policies.  The script also excludes user managed policies that are not used.

##Output
	The script will create a directory named with the account alias to contain all the output files beneath the directory this is run in.\
	 Directory Structure:\
	 		--myawsaccount             (will contain terraform files for each role and managed policy found)\
	 		 	|--assumrolepolicydocs (will contain json files for the assume role policies)\
	 		 	|--inlinepolicydocs    (will containd json files for all inline policies )\
	 		 	|--managedpolicydocs   (will contains jsonfiles for each customer managed policy)\


