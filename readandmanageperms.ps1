# by Hunter Watkins on 11/2/2022
# Use 'Connect-ExchangeOnline' first before running

# This gets all of the Read and Manage Permissions for every mailbox in the tenant

$mailboxes = Get-Mailbox -ResultSize unlimited | where{$_.RecipientTypeDetails -ne "DiscoveryMailbox"}

$output = foreach ($mailbox in $mailboxes){
    Get-MailboxPermission -Identity $mailbox.UserPrincipalName | where{$_.user -notlike "*self"}
}

Write-Output $output

$output | Export-CSV C:\temp\mailboxperms.csv