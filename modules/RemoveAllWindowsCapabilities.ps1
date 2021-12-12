#
# Created by Ken Hoo (mrkenhoo)
# DisableAllWindowsOptionalFeatures.ps1 module for sunvalley-srw
#
### Check system version and edition ###
if (!${validatedOsVersion}) {
    New-Variable -Name validatedOsVersion -Value "10.0.19043" 2>&1
}

if (!${OsVersion}) {
    New-Variable -Name osVersion -Value (gwmi win32_operatingsystem).version 2>&1
}

if (${OsVersion} -ne ${validatedOsVersion}) {
    Write-Error ('Please use Windows 10 (21H1) v' + ${validatedOsVersion} + ', instead. This script is known to the break the GUI of Windows Server and Windows 11.')
    Exit 1
} else {
    $wc = (Get-WindowsCapability -Online).Name
    Write-Host ('==> Found ' + $wc.Count + ' Windows capabilities...')
    $wc | ForEach-Object {
        Write-Host "    -> Removing capability: $_..."
        Remove-WindowsCapability -Name $_ -Online -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
    }
}
