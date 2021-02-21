<# Get all processes open by user
-----------------
Created by Hunter Watkins
-----------------
#>

# Get the username
$user = Read-Host -Prompt 'Input user name'

# Get all the open processes for the username
Get-Process -IncludeUserName | Where-Object UserName -match $user

<#
Make sure to run powershell as an admin
for the script to work properly
#>