#
# Created by Ken Hoo (mrkenhoo)
# DisableAllWindowsOptionalFeatures.ps1 module for sunvalley-srw
#
### Check system version and edition ###
if (!${validatedOsVersion}) {
    New-Variable -Name validatedOsVersion -Value "10.0.19044" 2>&1
}

if (!${OsVersion}) {
    New-Variable -Name osVersion -Value (gwmi win32_operatingsystem).version 2>&1
}

if (${OsVersion} -ne ${validatedOsVersion}) {
    Write-Error ('Please use Windows 10 (21H2) v' + ${validatedOsVersion} + ', instead. This script is known to break the GUI of Windows Server and Windows 11.')
    Write-Host -NoNewLine 'Press any key to continue...';
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
} else {
    $wc = (Get-WindowsCapability -Online).Name
    Write-Host ('==> Found ' + $wc.Count + ' Windows capabilities...')
    $wc | ForEach-Object {
        Write-Host "    -> Removing capability: $_..."
        Remove-WindowsCapability -Name $_ -Online -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
    }
}
