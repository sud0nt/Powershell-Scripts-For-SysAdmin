<# Connect to Office 365 for a client
-----------------
Created by Hunter Watkins
-----------------
#>

# Get the credentials
$cred = Get-Credential

# Connect to the Powershell Exchange Online Module, and make a session
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $cred -Authentication Basic -AllowRedirection

# Import the Powershell session you just made
Import-PSSession $Session -DisableNameChecking

<# 
Make sure to run `Remove-PSSession $Session`
when finished to log-off the session
#> 