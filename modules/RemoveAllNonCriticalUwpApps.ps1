  
#
# Created by Ken Hoo (mrkenhoo)
# RemoveAllNonCriticalUwpApps module for sunvalley-srw
#

Write-Host "==> Uninstalling UWP apps except critical ones..."
Get-AppxPackage -AllUsers | Where-Object {$_.name -notlike "*Microsoft.WindowsStore*"} | Where-Object {$_.name -notlike "*AppUp.IntelGraphicsExperience*"} | Where-Object {$_.name -notlike "*NVIDIACorp.NVIDIAControlPanel*"} | Where-Object {$_.name -notlike "*RealtekSemiconductorCorp.RealtekAudioControl*"} | Where-Object {$_.name -notlike "*Microsoft.VCLibs.140.00.UWPDesktop*"} | Where-Object {$_.name -notlike "*Microsoft.Winget.Source*"} | Where-Object {$_.name -notlike "*Microsoft.DesktopAppInstaller*"}  | Where-Object {$_.name -notlike "*Microsoft.WindowsTerminal*"} | Remove-AppxPackage -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
Get-AppxProvisionedPackage -Online | Where-Object {$_.name -notlike "*Microsoft.WindowsStore*"} | Where-Object {$_.name -notlike "*AppUp.IntelGraphicsExperience*"} | Where-Object {$_.name -notlike "*NVIDIACorp.NVIDIAControlPanel*"} | Where-Object {$_.name -notlike "*RealtekSemiconductorCorp.RealtekAudioControl*"} | Where-Object {$_.name -notlike "*Microsoft.VCLibs.140.00.UWPDesktop*"} | Where-Object {$_.name -notlike "*Microsoft.Winget.Source*"} | Where-Object {$_.name -notlike "*Microsoft.DesktopAppInstaller*"}  | Where-Object {$_.name -notlike "*Microsoft.WindowsTerminal*"} | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue -WarningAction SilentlyContinue

Write-Warning "The following UWP apps were left untouched: Windows Store, NVIDIA Control Panel, Realtek Audio Console, Intel Graphics Command Center, VCLibs.140.00.UWPDesktop, Microsoft.Winget.Source, Microsoft.DesktopAppInstaller, Microsoft.WindowsTerminal"

Write-Host -NoNewLine 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
