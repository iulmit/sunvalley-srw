#
# Created by Liam Powell (gfelipe099)
# ReinstallAllUwpApps module for sunvalley-srw
#

Write-Host "==> Reinstalling UWP apps..."
Get-AppxPackage -AllUsers | ForEach {Add-AppxPackage -Register "$($env:ProgramFiles)\WindowsApps\$_\AppxManifest.xml" -DisableDevelopmentMode} -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
Get-AppxProvisionedPackage -Online | ForEach {Add-AppxProvisionedPackage -Online -Register "$($env:ProgramFiles)\WindowsApps\$_\AppxManifest.xml" -DisableDevelopmentMode} -ErrorAction SilentlyContinue -WarningAction SilentlyContinue