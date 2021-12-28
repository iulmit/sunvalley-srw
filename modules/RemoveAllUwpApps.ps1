#
# Created by Ken Hoo (mrkenhoo)
# ReinstallAllUwpApps module for sunvalley-srw
#

Write-Host "==> Uninstalling UWP apps..."
Get-AppxPackage -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
Get-AppxProvisionedPackage -Online | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue -WarningAction SilentlyContinue

Write-Host -NoNewLine 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
