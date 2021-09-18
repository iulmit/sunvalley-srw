#
# Created by Ken Hoo (mrkenhoo)
# ApplySystemReadiness module for sunvalley-srw
#

Write-Host "==> Disabling system restore points..."
Disable-ComputerRestore -Drive "$($env:SystemDrive)\"

### Telemetry ###
Write-Host ""; Write-Host "==> Turning off telemetry..."
Write-Host "    --> Disabling data collection..."
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0

Write-Host "    --> Disabling scheduled tasks..."
Disable-ScheduledTask -TaskName "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" 2>&1
Disable-ScheduledTask -TaskName "Microsoft\Windows\Application Experience\ProgramDataUpdater" 2>&1
Disable-ScheduledTask -TaskName "Microsoft\Windows\Autochk\Proxy" 2>&1
Disable-ScheduledTask -TaskName "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" 2>&1
Disable-ScheduledTask -TaskName "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" 2>&1
Disable-ScheduledTask -TaskName "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" 2>&1

Write-Host "    --> Disabling application suggestions..."
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "ContentDeliveryAllowed" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "OemPreInstalledAppsEnabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "PreInstalledAppsEnabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "PreInstalledAppsEverEnabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SilentInstalledAppsEnabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338387Enabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338388Enabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338389Enabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353698Enabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemPaneSuggestionsEnabled" -Type DWord -Value 0
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Force 2>&1
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Name "DisableWindowsConsumerFeatures" -Type DWord -Value 1

Write-Host "    --> Disabling activity history..."
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableActivityFeed" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "PublishUserActivities" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "UploadUserActivities" -Type DWord -Value 0

Write-Host "    --> Disabling location tracking..."
If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location")) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Force 2>&1
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Type String -Value "Deny"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" -Name "SensorPermissionState" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" -Name "Status" -Type DWord -Value 0

Write-Host "        - Disabling automatic maps updates..."
Set-ItemProperty -Path "HKLM:\SYSTEM\Maps" -Name "AutoUpdateEnabled" -Type DWord -Value 0

Write-Host "    --> Disabling feedback data collection..."
If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules")) {
    New-Item -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Force 2>&1
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Name "NumberOfSIUFInPeriod" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "DoNotShowFeedbackNotifications" -Type DWord -Value 1
Disable-ScheduledTask -TaskName "Microsoft\Windows\Feedback\Siuf\DmClient" -ErrorAction SilentlyContinue 2>&1
Disable-ScheduledTask -TaskName "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" -ErrorAction SilentlyContinue 2>&1

Write-Host "    --> Disabling tailored experiences..."
If (!(Test-Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent")) {
    New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Force 2>&1
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Name "DisableTailoredExperiencesWithDiagnosticData" -Type DWord -Value 1

Write-Host "    --> Disabling advertising ID..."
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" 2>&1
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" -Name "DisabledByGroupPolicy" -Type DWord -Value 1

Write-Host "    --> Disabling Error reporting..."
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting" -Name "Disabled" -Type DWord -Value 1
Disable-ScheduledTask -TaskName "Microsoft\Windows\Windows Error Reporting\QueueReporting" 2>&1
    
Write-Host "    --> Restricting Windows Update P2P only to local network..."
If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config")) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" 2>&1
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" -Name "DODownloadMode" -Type DWord -Value 1

Write-Host "    --> Stopping and disabling Diagnostics Tracking Service..."
Stop-Service "DiagTrack" -WarningAction SilentlyContinue
Set-Service "DiagTrack" -StartupType Disabled
    
Write-Host "    --> Stopping and disabling WAP Push Service..."
Stop-Service "dmwappushservice" -WarningAction SilentlyContinue
Set-Service "dmwappushservice" -StartupType Disabled
       
Import-Module BitsTransfer 2>&1
Write-Host "==> Downloading O&O ShutUp10..."
cd $env:TEMP
Start-BitsTransfer -Source "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe" -Destination OOSU10.exe 2>&1
    
Write-Host "    --> Downloading mrkenhoo's O&O ShutUp10 privacy file..."
Start-BitsTransfer -Source "https://raw.githubusercontent.com/mrkenhoo/threshold-srb/master/ooshutup10.cfg" -Destination ooshutup10.cfg 2>&1

Write-Host "    --> Applying privacy policies from O&O ShutUp10 privacy file..."
.\OOSU10.exe ooshutup10.cfg /quiet
cd $PSScriptRoot
Remove-Module BitsTransfer

# Miscellaneous settings
Write-Host "==> Miscellaneous settings"

Write-Host "    --> Disabling background application access..."
Get-ChildItem -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" -Exclude "Microsoft.Windows.Cortana*" | ForEach {
    Set-ItemProperty -Path $_.PsPath -Name "Disabled" -Type DWord -Value 1
    Set-ItemProperty -Path $_.PsPath -Name "DisabledByUser" -Type DWord -Value 1
}

Write-Host "    --> Disabling Cortana..."
If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Personalization\Settings")) {
    New-Item -Path "HKCU:\SOFTWARE\Microsoft\Personalization\Settings" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Personalization\Settings" -Name "AcceptedPrivacyPolicy" -Type DWord -Value 0
If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization")) {
    New-Item -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Name "RestrictImplicitTextCollection" -Type DWord -Value 1
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Name "RestrictImplicitInkCollection" -Type DWord -Value 1
If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore")) {
    New-Item -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" -Name "HarvestContacts" -Type DWord -Value 0
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -Type DWord -Value 0

Write-Host "    --> Disabling driver offering through Windows Update..."
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Device Metadata" -Name "PreventDeviceMetadataFromNetwork" -Type DWord -Value 1
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Name "DontPromptForWindowsUpdate" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Name "DontSearchWindowsUpdate" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" -Name "DriverUpdateWizardWuSearchEnabled" -Type DWord -Value 0
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "ExcludeWUDriversInQualityUpdate" -Type DWord -Value 1
Write-Host "    --> Disabling Windows Update automatic restart..."
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoRebootWithLoggedOnUsers" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "AUPowerManagement" -Type DWord -Value 0

Write-Host "    --> Disabling Action Center..."
If (!(Test-Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer")) {
    New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" | Out-Null
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "DisableNotificationCenter" -Type DWord -Value 1
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" -Name "ToastEnabled" -Type DWord -Value 0

Write-Host "    --> Adjusting visual effects for performance..."
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "DragFullWindows" -Type String -Value 0
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Type String -Value 200
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "UserPreferencesMask" -Type Binary -Value ([byte[]](144,18,3,128,16,0,0,0))
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Type String -Value 0
Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardDelay" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewAlphaSelect" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewShadow" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAnimations" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Type DWord -Value 3
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\DWM" -Name "EnableAeroPeek" -Type DWord -Value 0

Write-Host "    --> Disabling OneDrive..."
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive" -Name "DisableFileSyncNGSC" -Type DWord -Value 1
Write-Host "    --> Uninstalling OneDrive..."
Stop-Process -Name "OneDrive" -ErrorAction SilentlyContinue
Start-Sleep -s 2
$onedrive = "$env:SystemRoot\SysWOW64\OneDriveSetup.exe"
If (!(Test-Path $onedrive)) {
    $onedrive = "$env:SystemRoot\System32\OneDriveSetup.exe"
}
Start-Process $onedrive "/uninstall" -NoNewWindow -Wait
Start-Sleep -s 2
Stop-Process -Name "explorer" -ErrorAction SilentlyContinue
Start-Sleep -s 2
Remove-Item -Path "$env:UserProfile\OneDrive" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$env:LocalAppData\Microsoft\OneDrive" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$env:ProgramData\Microsoft OneDrive" -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "$env:SystemDrive\OneDriveTemp" -Force -Recurse -ErrorAction SilentlyContinue
If (!(Test-Path "HKCR:")) {
    New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT | Out-Null
}
Remove-Item -Path "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path "HKCR:\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" -Recurse -ErrorAction SilentlyContinue


Write-Host "    --> Stopping and disabling HomeGroup services..."
Stop-Service "HomeGroupListener" -ErrorActio SilentlyContinue -WarningAction SilentlyContinue
Set-Service "HomeGroupListener" -StartupType Disabled -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
Stop-Service "HomeGroupProvider" -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
Set-Service "HomeGroupProvider" -StartupType Disabled -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
    
Write-Host "    --> Disabling Remote Assistance..."
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Remote Assistance" -Name "fAllowToGetHelp" -Type DWord -Value 0

Write-Host "    --> Disabling Storage Sense..."
Remove-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" -Recurse -ErrorAction SilentlyContinue -WarningAction SilentlyContinue

Write-Host "    --> Stopping and disabling Superfetch service..."
Stop-Service "SysMain" -WarningAction SilentlyContinue
Set-Service "SysMain" -StartupType Disabled

Write-Host "    --> Setting BIOS time to UTC..."
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" -Name "RealTimeIsUniversal" -Type DWord -Value 1

Write-Host "    --> Enabling advanced details in Task Manager..."
$taskmgr = Start-Process -WindowStyle Hidden -FilePath $env:SystemRoot\System32\Taskmgr.exe -PassThru
Do {
    Start-Sleep -Milliseconds 100
    $preferences = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\TaskManager" -Name "Preferences" -ErrorAction SilentlyContinue
} Until ($preferences)
Stop-Process $taskmgr
$preferences.Preferences[28] = 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\TaskManager" -Name "Preferences" -Type Binary -Value $preferences.Preferences
    
Write-Host "    --> Enabling enthusiast mode on file transfer operations..."
If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager")) {
    New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" 2>&1
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" -Name "EnthusiastMode" -Type DWord -Value 1
    
Write-Host "    --> Disabling task view button on the taskbar..."
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Type DWord -Value 0
    
Write-Host "    --> Disable people icon on the taskbar..."
If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People")) {
    New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" 2>&1
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name "PeopleBand" -Type DWord -Value 0
    
Write-Host "    --> Disabling autotray on the taskbar..."
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "EnableAutoTray" -Type DWord -Value 0
    
Write-Host "    --> Enabling NumLock after startup..."
If (!(Test-Path "HKU:")) {
    New-PSDrive -Name HKU -PSProvider Registry -Root HKEY_USERS 2>&1
}
Set-ItemProperty -Path "HKU:\.DEFAULT\Control Panel\Keyboard" -Name "InitialKeyboardIndicators" -Type DWord -Value 2147483650

Write-Host "    --> Changing default Explorer view to This PC..."
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -Type DWord -Value 1

Write-Host "    --> Hiding 3D Objects icon from This PC..."
Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" -Recurse -ErrorAction SilentlyContinue

Write-Host "    --> Increasing IRP stack size to 20..."
	        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "IRPStackSize" -Type DWord -Value 20

Write-Host "    --> Increasing SvcHost split threshold to 4,194,304 KB..."
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Type DWord -Value 4194304

Write-Host "    --> Disable Windows Feeds..."
if (!(Test-Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds")) {
    New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" -Force 2>&1
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" -Name "EnableFeeds" -Type DWord -Value 0

Write-Host "    --> Disabling Bing search in start menu..."
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "CortanaConsent" -Type DWord -Value 0
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Force 2>&1
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "DisableWebSearch" -Type DWord -Value 1

Write-Host "    --> Stopping and disabling Windows Search indexing service..."
Stop-Service "WSearch" -WarningAction SilentlyContinue
Set-Service "WSearch" -StartupType Disabled

Write-Host "    --> Disabling searchbox in taskbar..."
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 0

Write-Host "    --> Disabling Windows Error Reporting..."
Disable-WindowsErrorReporting
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting" -Name "Disabled" -Type DWord -Value 1
Disable-ScheduledTask -TaskName "Microsoft\Windows\Windows Error Reporting\QueueReporting" 2>&1

Write-Host "    --> Disabling legacy boot menu options..."
bcdedit /set ${current} bootmenupolicy Standard 2>&1

Write-Host "    --> Disabling hibernation..."
powercfg -h off
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Session Manager\Power" -Name "HibernateEnabled" -Type Dword -Value 0
If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings")) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" 2>&1
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" -Name "ShowHibernateOption" -Type Dword -Value 0

Write-Host "    --> Disabling hiberboot..."
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Session Manager\Power" -Name "HiberbootEnabled" -Type Dword -Value 0

Write-Host "    --> Setting Data Execution Prevention (DEP) to 'AlwaysOn'..."
bcdedit /set `{current`} nx AlwaysOn

Write-Host "    --> Disabling auto reboot on system crash (BSOD)..."
wmic recoveros set AutoReboot = False

Write-Host "    --> Disabling system crash dumping..."
wmic recoveros set DebugInfoType = 0

Write-Host ""; Write-Host "    --> Windows optional features"
$wof = (Get-WindowsOptionalFeature -FeatureName '*' -Online).FeatureName
Write-Host ('        -> Found ' + $wof.Count + ' Windows optional feature(s) on this system')
$wof | ForEach-Object {
    Write-Host "            - Removing optional feature: $_..."
    Disable-WindowsOptionalFeature -FeatureName $_ -Online -NoRestart -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
}

Write-Host ""; Write-Host "==> Windows capabilities"
$wc = (Get-WindowsCapability -Online).Name
Write-Host ('        -> Found ' + $wc.Count + ' Windows capabilitities...')
$wc | ForEach-Object {
    Write-Host "            - Removing capatiblity: $_..."
    Remove-WindowsCapability -Name $_ -Online -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
}
