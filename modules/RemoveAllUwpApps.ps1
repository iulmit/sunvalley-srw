#
# Created by Liam Powell (gfelipe099)
# ReinstallAllUwpApps module for sunvalley-srw
#

Write-Host "==> Uninstalling UWP apps..."
Get-AppxPackage -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
Get-AppxProvisionedPackage -Online | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue -WarningAction SilentlyContinue