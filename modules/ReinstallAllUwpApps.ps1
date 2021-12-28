#
# Created by Ken Hoo (mrkenhoo)
# ReinstallAllUwpApps module for sunvalley-srw
#

Write-Host "==> Reinstalling UWP apps..."
Get-AppxPackage -AllUsers | ForEach {Add-AppxPackage -Register "$($env:ProgramFiles)\WindowsApps\$_\AppxManifest.xml" -DisableDevelopmentMode} -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
Get-AppxProvisionedPackage -Online | ForEach {Add-AppxProvisionedPackage -Online -Register "$($env:ProgramFiles)\WindowsApps\$_\AppxManifest.xml" -DisableDevelopmentMode} -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
Write-Host -NoNewLine 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
