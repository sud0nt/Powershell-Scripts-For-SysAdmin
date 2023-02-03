# Written by Hunter Watkins on 1/30/2023
# This will remove the computer from a local AD domain
# and move it to a WORKGROUP.

Set-ExecutionPolicy Bypass

$cred = Get-Credential

# Create a scheduled task to run the script at the next startup
# Make sure you put the other file in C:\temp\connectmachine_toAAD.ps1
$action = New-ScheduledTaskAction -Execute 'C:\temp\connectmachine_toAAD.ps1'
$trigger = New-ScheduledTaskTriger -AtStartup
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "Run next powershell script to connect to AzureAD" 

Remove-Computer -ComputerName "localhost" -UnjoinDomainCredential $cred -WorkgroupName "WORKGROUP" -Restart -Force

