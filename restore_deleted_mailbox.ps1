<# Restore deleted mailbox in O365
-----------------
Created by Hunter Watkins
-----------------
#>

# Connect to the Microsoft Online Service for Azure AD
Connect-MsolService

# Store principal mailbox in a variable
$mailbox = Read-Host -Prompt 'Input users prinicpal mailbox: '

# Restore the mailbox from the variable
Restore-MsolUser -UserPrincipalName $mailbox

<#
Make sure to run as an admin for the
script to work properly
#>