# Created by Hunter Watkins on 08/15/2022

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# MAKE SURE TO CHANGE THE PATH TO THE UVHD YOU ARE TRYING TO DISMOUNT
# MAKE SURE TO CHANGE THE USERNAME TO THE USER YOU ARE WORKING WITH
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Dismount-DiskImage -ImagePath "E:\UPD\UVHD-S-1-5-21-1709600234-3241887798-4080042406-3144.vhdx"

$UPDSharePath="<changeme>"
$username="<changeme>"
 
#Get's User SID
$strSID = (New-Object System.Security.Principal.NTAccount($username)).Translate([System.Security.Principal.SecurityIdentifier]).value
 
#Creates UPD path String
$diskname=$UPDSharePath+"\UVHD-"+$strsid+".vhdx"
 
#Finds the disk and dismounts it
Get-DiskImage $diskname | Dismount-DiskImage