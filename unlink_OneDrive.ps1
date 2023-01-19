# Created by Hunter Watkins on 08/22/2022

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# This involves deleting Registry Keys, so use at your own risk
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# Check OneDrive process to see if it's running
$checkProcess = Get-Process OneDrive -ErrorAction SilentlyContinue

# Get the CLSID from the registry
$path = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\Namespace\'
$data = '<SHAREPOINT SITE NAME>' 
$CLSID = Get-ChildItem -Path $path | ForEach-Object{
    Get-ItemProperty -Path $_.PSPath | Where-Object {$_.'(default)' -eq $data} | Select-Object -ExpandProperty PSChildName
}

Start-Sleep -Seconds 1.0

# If OneDrive isn't running delete keys, if it is running stop OneDrive and delete keys
if($checkProcess -eq $null) {
    Remove-Item -Path "HKCU:\Software\Microsoft\OneDrive\Accounts\Business1\" -Recurse
    Remove-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\$CLSID\" -Recurse
}

else {
    Stop-Process -Name "OneDrive"
    Remove-Item -Path "HKCU:\Software\Microsoft\OneDrive\Accounts\Business1\" -Recurse
    Remove-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\$CLSID\"  -Recurse
}