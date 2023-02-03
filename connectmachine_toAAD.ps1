# Written by Hunter Watkins on 1/30/2023
# This will Connect the computer to the AAD domain

Install-Module -Name AzureAD

$cred = Get-Credential

Connect-AzureAD -Credential $cred

# Unregister the scheduled task that was created from previous script
Unregister-ScheduledTask -TaskName "Run next powershell script to connect to AzureAD"