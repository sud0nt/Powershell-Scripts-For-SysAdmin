# Created by Hunter Watkins on 11/22/2022

# Connect to MS Online Service
Connect-MsolService

# List licensed users and store in variable
$Users = Get-MsolUser -All | where {$_.isLicensed -eq $true} | Select-Object DisplayName,userprincipalname,isLicensed

# Output variable to a CSV file
$Users | Export-Csv "C:\temp\licensed_mailboxes.csv" -NoTypeInformation

Start-Sleep -Seconds 1.0

# Close open MSolService session
[Microsoft.Online.Administration.Automation.ConnectMsolService]::ClearUserSessionState()