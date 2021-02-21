<# Find inactive computers in Active Directory
-----------------
Created by Hunter Watkins
-----------------
#>

# Prompt for input for number of days of inactivity
$DaysInactive = Read-Host -Prompt 'How many days of inactivity? '

# Calculate the days of inactivity
$Time = (Get-Date).AddDays(-($DaysInactive))

# Find the computers and export the output to a CSV
Get-ADComputer -Filter {LastLogonTimeStamp -lt $time} -ResultPageSize 2000 -resultSetSize $null -Properties Name, OperatingSystem, SamAccountName, DistinguishedName | Export-CSV “C:\Temp\StaleComps.CSV” –NoTypeInformation

<#
Make sure to install Active Directory Powershell module first
You can do this from a Powershell console with:
`Install-WindowsFeature RSAT-AD PowerShell`
#>