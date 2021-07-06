#
# Created by Liam Powell (gfelipe099)
# A fork from ChrisTitusTech's https://github.com/ChrisTitusTech/win10script
# sunvalley-srw.ps1 file
# System Readiness for Workstations
# For Microsoft Windows 10 Pro N for Workstations x64
#
Clear-Host

### Check system version and edition ###
if (!${validatedOsVersion}) {
    New-Variable -Name validatedOsVersion -Value "10.0.22000" | Out-Null
}

if (!${validatedOsEdition}) {
    New-Variable -Name validatedOsEdition -Value "Microsoft Windows 11 Pro N for Workstations" | Out-Null
}

if (!${OsVersion}) {
    New-Variable -Name osVersion -Value (gwmi win32_operatingsystem).version | Out-Null
}

if (!${OsEdition}) {
    New-Variable -Name osEdition -Value (gwmi win32_operatingsystem).caption | Out-Null
}

${WShell} = New-Object -ComObject Wscript.Shell
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()
    If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
        Switch ([System.Windows.Forms.MessageBox]::Show("This script needs Administrator privileges to run. Do you want to give permissions to this script?", "Insufficient permissions", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Warning)) {
        Yes {
            Start-Process PowerShell.exe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"{0}`"" -f $PSCommandPath) -Verb RunAs
            Exit
        }
        No {
                Write-Error "This script needs Administrator privileges to work, try again."
                Start-Sleep 5
                Exit
        }
    }
}

${sunvalley-srw}                                                = New-Object System.Windows.Forms.Form
${sunvalley-srw}.ClientSize                                     = New-Object System.Drawing.Point(1050,700)
${sunvalley-srw}.Text                                           = "System Readiness for Workstations"
${sunvalley-srw}.TopMost                                        = $false

${ProgramsContainer}                                            = New-Object System.Windows.Forms.Panel
${ProgramsContainer}.AutoSize                                   = $true

${ProgramsSetup}                                                = New-Object System.Windows.Forms.Label
${ProgramsSetup}.Text                                           = "Programs Setup"
${ProgramsSetup}.AutoSize                                       = $true
${ProgramsSetup}.Location                                       = New-Object System.Drawing.Point(10,15)
${ProgramsSetup}.Font                                           = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${ProgramsSetup_Install_Chocolatey}                             = New-Object System.Windows.Forms.Button
${ProgramsSetup_Install_Chocolatey}.Text                        = "Install Chocolatey"
${ProgramsSetup_Install_Chocolatey}.AutoSize                    = $true
${ProgramsSetup_Install_Chocolatey}.Location                    = New-Object System.Drawing.Point(20,65)
${ProgramsSetup_Install_Chocolatey}.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${ProgramsSetup_Install_7zip}                                   = New-Object System.Windows.Forms.Button
${ProgramsSetup_Install_7zip}.Text                              = "Install 7-Zip"
${ProgramsSetup_Install_7zip}.AutoSize                          = $true
${ProgramsSetup_Install_7zip}.Location                          = New-Object System.Drawing.Point(20,115)
${ProgramsSetup_Install_7zip}.Font                              = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${ProgramsSetup_Install_Steam}                                  = New-Object System.Windows.Forms.Button
${ProgramsSetup_Install_Steam}.Text                             = "Install Steam"
${ProgramsSetup_Install_Steam}.AutoSize                         = $true
${ProgramsSetup_Install_Steam}.Location                         = New-Object System.Drawing.Point(20,165)
${ProgramsSetup_Install_Steam}.Font                             = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${ProgramsSetup_Install_Rwc}                                    = New-Object System.Windows.Forms.Button
${ProgramsSetup_Install_Rwc}.Text                               = "Install Reddit Wallpaper Changer"
${ProgramsSetup_Install_Rwc}.AutoSize                           = $true
${ProgramsSetup_Install_Rwc}.Location                           = New-Object System.Drawing.Point(20,215)
${ProgramsSetup_Install_Rwc}.Font                               = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${ProgramsSetup_Install_Egl}                                    = New-Object System.Windows.Forms.Button
${ProgramsSetup_Install_Egl}.Text                               = "Install Epic Games Launcher"
${ProgramsSetup_Install_Egl}.AutoSize                           = $true
${ProgramsSetup_Install_Egl}.Location                           = New-Object System.Drawing.Point(20,265)
${ProgramsSetup_Install_Egl}.Font                               = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${ProgramsSetup_Install_Origin}                                 = New-Object System.Windows.Forms.Button
${ProgramsSetup_Install_Origin}.Text                            = "Install Origin"
${ProgramsSetup_Install_Origin}.AutoSize                        = $true
${ProgramsSetup_Install_Origin}.Location                        = New-Object System.Drawing.Point(20,315)
${ProgramsSetup_Install_Origin}.Font                            = New-Object System.Drawing.Font('Microsoft Sans Serif',20)


${ProgramsSetup_Install_Spotify}                                = New-Object System.Windows.Forms.Button
${ProgramsSetup_Install_Spotify}.Text                           = "Install Spotify"
${ProgramsSetup_Install_Spotify}.AutoSize                       = $true
${ProgramsSetup_Install_Spotify}.Location                       = New-Object System.Drawing.Point(20,365)
${ProgramsSetup_Install_Spotify}.Font                           = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${ProgramsSetup_Install_Discord}                                = New-Object System.Windows.Forms.Button
${ProgramsSetup_Install_Discord}.Text                           = "Install Discord"
${ProgramsSetup_Install_Discord}.AutoSize                       = $true
${ProgramsSetup_Install_Discord}.Location                       = New-Object System.Drawing.Point(20,415)
${ProgramsSetup_Install_Discord}.Font                           = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${ProgramsSetup_Install_Bleachbit}                              = New-Object System.Windows.Forms.Button
${ProgramsSetup_Install_Bleachbit}.Text                         = "Install BleachBit"
${ProgramsSetup_Install_Bleachbit}.AutoSize                     = $true
${ProgramsSetup_Install_Bleachbit}.Location                     = New-Object System.Drawing.Point(20,465)
${ProgramsSetup_Install_Bleachbit}.Font                         = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${ProgramsSetup_Install_NVCleanstall}                           = New-Object System.Windows.Forms.Button
${ProgramsSetup_Install_NVCleanstall}.Text                      = "Install NVCleanstall"
${ProgramsSetup_Install_NVCleanstall}.AutoSize                  = $true
${ProgramsSetup_Install_NVCleanstall}.Location                  = New-Object System.Drawing.Point(20,515)
${ProgramsSetup_Install_NVCleanstall}.Font                      = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${ProgramsSetup_Uninstall_Chocolatey}                           = New-Object System.Windows.Forms.Button
${ProgramsSetup_Uninstall_Chocolatey}.Text                      = "Uninstall Chocolatey"
${ProgramsSetup_Uninstall_Chocolatey}.AutoSize                  = $true
${ProgramsSetup_Uninstall_Chocolatey}.Location                  = New-Object System.Drawing.Point(20,565)
${ProgramsSetup_Uninstall_Chocolatey}.Font                      = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${ProgramsSetup_CheckForUpdates_Chocolatey}                     = New-Object System.Windows.Forms.Button
${ProgramsSetup_CheckForUpdates_Chocolatey}.Text                = "Upgrade Chocolatey packages"
${ProgramsSetup_CheckForUpdates_Chocolatey}.AutoSize            = $true
${ProgramsSetup_CheckForUpdates_Chocolatey}.Location            = New-Object System.Drawing.Point(20,615)
${ProgramsSetup_CheckForUpdates_Chocolatey}.Font                = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${SystemAdministration}                                         = New-Object System.Windows.Forms.Panel
${SystemAdministration}.AutoSize                                = $true

${SystemReadiness}                                              = New-Object System.Windows.Forms.Label
${SystemReadiness}.Text                                         = "System Administration"
${SystemReadiness}.AutoSize                                     = $true
${SystemReadiness}.Location                                     = New-Object System.Drawing.Point(560,15)
${SystemReadiness}.Font                                         = New-Object System.Drawing.Font('Microsoft Sans Serif',30)

${SystemReadiness_Apply}                                        = New-Object System.Windows.Forms.Button
${SystemReadiness_Apply}.Text                                   = "Apply System Readiness"
${SystemReadiness_Apply}.AutoSize                               = $true
${SystemReadiness_Apply}.Location                               = New-Object System.Drawing.Point(570,80)
${SystemReadiness_Apply}.Font                                   = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${SystemReadiness_RemoveUwpApps}                                = New-Object System.Windows.Forms.Button
${SystemReadiness_RemoveUwpApps}.Text                           = "Remove non-critical UWP apps"
${SystemReadiness_RemoveUwpApps}.AutoSize                       = $true
${SystemReadiness_RemoveUwpApps}.Location                       = New-Object System.Drawing.Point(570,135)
${SystemReadiness_RemoveUwpApps}.Font                           = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${SystemReadiness_RemoveAllUwpApps}                             = New-Object System.Windows.Forms.Button
${SystemReadiness_RemoveAllUwpApps}.Text                        = "Remove all UWP apps"
${SystemReadiness_RemoveAllUwpApps}.AutoSize                    = $true
${SystemReadiness_RemoveAllUwpApps}.Location                    = New-Object System.Drawing.Point(570,190)
${SystemReadiness_RemoveAllUwpApps}.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${ThirdpartyContainer}                                          = New-Object System.Windows.Forms.Panel
${ThirdpartyContainer}.AutoSize                                 = $true

${ThirdpartyContainer_Label}                                    = New-Object System.Windows.Forms.Label
${ThirdpartyContainer_Label}.Text                               = "Third-party Scripts"
${ThirdpartyContainer_Label}.AutoSize                           = $true
${ThirdpartyContainer_Label}.Location                           = New-Object System.Drawing.Point(560,465)
${ThirdpartyContainer_Label}.Font                               = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${ThirdpartyContainer_CttWin10script}                           = New-Object System.Windows.Forms.Button
${ThirdpartyContainer_CttWin10script}.Text                      = "Launch CTT's win10script"
${ThirdpartyContainer_CttWin10script}.AutoSize                  = $true
${ThirdpartyContainer_CttWin10script}.Location                  = New-Object System.Drawing.Point(570,520)
${ThirdpartyContainer_CttWin10script}.Font                      = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${ProgramsSetup_Install_Chocolatey}.Add_Click({
    Write-Host "Installing Chocolatey package manager for Windows... "
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) | Out-Null
    choco install chocolatey-core.extension -y
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Install_Chocolatey}.Text)",0x0)
})

${ProgramsSetup_Install_7Zip}.Add_Click({
    Write-Host "Installing 7-Zip... "
    choco install 7zip.install -y
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Install_7Zip}.Text)",0x0)
})

${ProgramsSetup_Install_Steam}.Add_Click({
    Write-Host "Installing Steam... "
    choco install steam -y
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Install_Steam}.Text)",0x0)
})

${ProgramsSetup_Install_Rwc}.Add_Click({
    Write-Host "Installing Reddit Wallpaper Changer... "
    choco install reddit-wallpaper-changer -y
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Install_Rwc}.Text)",0x0)
})

${ProgramsSetup_Install_Egl}.Add_Click({
    Write-Host "Installing Epic Games Launcher... "
    choco install epicgameslauncher -y
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Install_Egl}.Text)",0x0)
})

${ProgramsSetup_Install_Origin}.Add_Click({
    Write-Host "Installing Origin... "
    choco install origin -y
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Install_Origin}.Text)",0x0)
})


${ProgramsSetup_Install_Spotify}.Add_Click({
    Write-Host "Installing Spotify... "
    choco install spotify -y
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Install_Spotify}.Text)",0x0)
})

${ProgramsSetup_Install_Discord}.Add_Click({
    Write-Host "Installing Discord... "
    choco install discord.install -y
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Install_Discord}.Text)",0x0)
})

${ProgramsSetup_Install_Bleachbit}.Add_Click({
    Write-Host "Installing BleachBit... "
    choco install bleachbit.install -y
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Install_Bleachbit}.Text)",0x0)
})

${ProgramsSetup_Install_NVCleanstall}.Add_Click({
    Write-Host "Installing NVCleanstall... "
    Invoke-WebRequest -Uri https://uk1-dl.techpowerup.com/files/hZS7AqU78Hh2Bg3MRXyz7A/1625074761/NVCleanstall_1.9.0.exe -OutFile NVCleanstall.exe -ErrorAction Stop
    .\NVCleanstall.exe
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Install_NVCleanstall}.Text)",0x0)
})

${ProgramsSetup_Uninstall_Chocolatey}.Add_Click({
    $VerbosePreference = 'Continue'
if (-not $env:ChocolateyInstall) {
    $message = @(
        "The ChocolateyInstall environment variable was not found."
        "Chocolatey is not detected as installed. Nothing to do."
    ) -join "`n"

    Write-Warning $message
    return
}

if (-not (Test-Path $env:ChocolateyInstall)) {
    $message = @(
        "No Chocolatey installation detected at '$env:ChocolateyInstall'."
        "Nothing to do."
    ) -join "`n"

    Write-Warning $message
    return
}

<#
    Using the .NET registry calls is necessary here in order to preserve environment variables embedded in PATH values;
    Powershell's registry provider doesn't provide a method of preserving variable references, and we don't want to
    accidentally overwrite them with absolute path values. Where the registry allows us to see "%SystemRoot%" in a PATH
    entry, PowerShell's registry provider only sees "C:\Windows", for example.
#>
$userKey = [Microsoft.Win32.Registry]::CurrentUser.OpenSubKey('Environment')
$userPath = $userKey.GetValue('PATH', [string]::Empty, 'DoNotExpandEnvironmentNames').ToString()

$machineKey = [Microsoft.Win32.Registry]::LocalMachine.OpenSubKey('SYSTEM\ControlSet001\Control\Session Manager\Environment\')
$machinePath = $machineKey.GetValue('PATH', [string]::Empty, 'DoNotExpandEnvironmentNames').ToString()

$backupPATHs = @(
    "User PATH: $userPath"
    "Machine PATH: $machinePath"
)
$backupFile = "C:\PATH_backups_ChocolateyUninstall.txt"
$backupPATHs | Set-Content -Path $backupFile -Encoding UTF8 -Force

$warningMessage = @"
    This could cause issues after reboot where nothing is found if something goes wrong.
    In that case, look at the backup file for the original PATH values in '$backupFile'.
"@

if ($userPath -like "*$env:ChocolateyInstall*") {
    Write-Verbose "Chocolatey Install location found in User Path. Removing..."
    Write-Warning $warningMessage

    $newUserPATH = @(
        $userPath -split [System.IO.Path]::PathSeparator |
            Where-Object { $_ -and $_ -ne "$env:ChocolateyInstall\bin" }
    ) -join [System.IO.Path]::PathSeparator

    # NEVER use [Environment]::SetEnvironmentVariable() for PATH values; see https://github.com/dotnet/corefx/issues/36449
    # This issue exists in ALL released versions of .NET and .NET Core as of 12/19/2019
    $userKey.SetValue('PATH', $newUserPATH, 'ExpandString')
}

if ($machinePath -like "*$env:ChocolateyInstall*") {
    Write-Verbose "Chocolatey Install location found in Machine Path. Removing..."
    Write-Warning $warningMessage

    $newMachinePATH = @(
        $machinePath -split [System.IO.Path]::PathSeparator |
            Where-Object { $_ -and $_ -ne "$env:ChocolateyInstall\bin" }
    ) -join [System.IO.Path]::PathSeparator

    # NEVER use [Environment]::SetEnvironmentVariable() for PATH values; see https://github.com/dotnet/corefx/issues/36449
    # This issue exists in ALL released versions of .NET and .NET Core as of 12/19/2019
    $machineKey.SetValue('PATH', $newMachinePATH, 'ExpandString')
}

# Adapt for any services running in subfolders of ChocolateyInstall
$agentService = Get-Service -Name chocolatey-agent -ErrorAction SilentlyContinue
if ($agentService -and $agentService.Status -eq 'Running') {
    $agentService.Stop()
}
# TODO: add other services here

Remove-Item -Path $env:ChocolateyInstall -Recurse -Force

'ChocolateyInstall', 'ChocolateyLastPathUpdate' | ForEach-Object {
    foreach ($scope in 'User', 'Machine') {
        [Environment]::SetEnvironmentVariable($_, [string]::Empty, $scope)
    }
}

$machineKey.Close()
$userKey.Close()

if ($env:ChocolateyToolsLocation -and (Test-Path $env:ChocolateyToolsLocation)) {
    Remove-Item -Path $env:ChocolateyToolsLocation -WhatIf -Recurse -Force
}

foreach ($scope in 'User', 'Machine') {
    [Environment]::SetEnvironmentVariable('ChocolateyToolsLocation', [string]::Empty, $scope)
}
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Uninstall_Chocolatey}.Text)",0x0)
    Write-Host "Operation completed"
})

${ProgramsSetup_CheckForUpdates_Chocolatey}.Add_Click({
    Write-Warning "Updating chocolatey packages (if any)..."
    choco upgrade all -y
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_CheckForUpdates_Chocolatey}.Text)",0x0)
})

${SystemReadiness_Apply}.Add_Click({
    # Privacy settings
    Write-Host "Applying privacy settings..."
    Import-Module BitsTransfer | Out-Null
    Start-BitsTransfer -Source "https://raw.githubusercontent.com/gfelipe099/threshold-srb/master/ooshutup10.cfg" -Destination ooshutup10.cfg | Out-Null
    Start-BitsTransfer -Source "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe" -Destination OOSU10.exe | Out-Null
    ./OOSU10.exe ooshutup10.cfg /quiet
    Remove-Module BitsTransfer

    # Performance settings
    Write-Host "Applying performance settings..."
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewAlphaSelect" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewShadow" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAnimations" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\" -Name "IconsOnly" -Type DWord -Value 1
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Type DWord -Value 3
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\DWM" -Name "EnableAeroPeek" -Type DWord -Value 0

    # Interface settings
    Write-Host "Applying interface settings..."
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAl" -Type DWord -Value 0
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name SmartScreenEnabled -Value Block
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HiddenFileExt" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\" -Name "ShowTaskBarButton" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\" -Name "ShowCortanaButton" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name "PeopleBand" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "DisableNotificationCenter" -Type DWord -Value 1
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" -Name "ToastEnabled" -Type DWord -Value 0

    # Miscellaneous
    Write-Host "Disabling Windows Error Reporting..."
    Disable-WindowsErrorReporting

    # Windows optional features
    $wof = (Get-WindowsOptionalFeature -FeatureName '*' -Online).FeatureName
    Write-Host ('Disabling ' + $wof.Count + ' Windows optional features...')
    $wof | ForEach-Object {
        if ($_ -notlike "*LegacyComponents*" -and "*DirectPlay*" -and "NetFx3" -and "NetFx4-Advsrvs" -and "*WCF-Services45*" -and "*WCF-TCP-PortSharing45*" -and "*Windows-Defender-Default-Definitions*") {
            Disable-WindowsOptionalFeature -FeatureName $_ -Online -NoRestart -WarningAction SilentlyContinue | Out-Null
        }
    }

    # Windows capabilities
    $wc = (Get-WindowsCapability -Online).Name
    Write-Host ('Removing ' + $wc.Count + ' Windows capabilities...')
    $wc | ForEach-Object {
        Remove-WindowsCapability -Name $_ -Online -WarningAction SilentlyContinue | Out-Null
    }
    Remove-Printer -Name "Fax" -ErrorAction SilentlyContinue | Out-Null
    ${WShell}.Popup("Operation completed",0,"$(${SystemReadiness_Apply}.Text)",0x0)
})

${SystemReadiness_RemoveAllUwpApps}.Add_Click({
    Write-Host "Uninstalling UWP apps..."
    Get-AppxPackage -AllUsers | Remove-AppxPackage
    Get-AppxProvisionedPackage -Online | Remove-AppxProvisionedPackage -Online
})

${SystemReadiness_RemoveUwpApps}.Add_Click({
    Write-Host "Uninstalling UWP apps except critical ones..."
    Get-AppxPackage -AllUsers | Where-Object {$_.name -notlike "*Microsoft.WindowsStore*"} | Where-Object {$_.name -notlike "*AppUp.IntelGraphicsExperience*"} | Where-Object {$_.name -notlike "*NVIDIACorp.NVIDIAControlPanel*"} | Where-Object {$_.name -notlike "*RealtekSemiconductorCorp.RealtekAudioControl*"} | Remove-AppxPackage
    Get-AppxProvisionedPackage -Online | Where-Object {$_.name -notlike "*Microsoft.WindowsStore*"} | Where-Object {$_.name -notlike "*AppUp.IntelGraphicsExperience*"} | Where-Object {$_.name -notlike "*NVIDIACorp.NVIDIAControlPanel*"} | Where-Object {$_.name -notlike "*RealtekSemiconductorCorp.RealtekAudioControl*"} | Remove-AppxProvisionedPackage -Online
    Write-Warning "WARNING: The following UWP apps has been left installed, they provide critical functionalities to the system: Windows Store, NVIDIA Control Panel, Realtek Audio Console and Intel Graphics Command Center"
})

${ThirdpartyContainer_CttWin10script}.Add_Click({
    Write-Host "Downloading and executing ChristTitusTech's win10script..."
    iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/JJ8R4'))
})

${sunvalley-srw}.Controls.AddRange(@(${ProgramsContainer},${SystemAdministration},${ThirdpartyContainer}))
${ProgramsContainer}.Controls.AddRange(@(${ProgramsSetup},${ProgramsSetup_Install_Chocolatey},${ProgramsSetup_Install_7zip},${ProgramsSetup_Install_Steam},${ProgramsSetup_Install_Rwc},${ProgramsSetup_Install_Egl},${ProgramsSetup_Install_Origin},${ProgramsSetup_Install_Spotify},${ProgramsSetup_Install_Discord},${ProgramsSetup_Install_Bleachbit},${ProgramsSetup_Install_NVCleanstall},${SystemReadiness_Apply},${ProgramsSetup_Uninstall_Chocolatey},${ProgramsSetup_CheckForUpdates_Chocolatey}))
${SystemAdministration}.Controls.AddRange(@(${SystemReadiness},${SystemReadiness_Apply},${SystemReadiness_RemoveAllUwp},${SystemReadiness_RemoveAllUwpApps},${SystemReadiness_RemoveUwpApps}))
${ThirdpartyContainer}.Controls.AddRange(@(${ThirdpartyContainer_Label},${ThirdpartyContainer_CttWin10script}))

if (${OsEdition} -ne "${validatedOsEdition}") {
    ${WShell}.Popup("The OS edition you are using is not validated to use with this script. You need to use ${validatedOsEdition}, and you are using: ${OsEdition}.",0,"$(${sunvalley-srw}.Text)",0x0)
    Exit
}

if (${OsVersion} -ne "${validatedOsVersion}") {
    ${WShell}.Popup("Your version of Windows is not validated on this script. You need to use ${validatedOsVersion}, and you are using ${OsVersion}.",0,"$(${sunvalley-srw}.Text)",0x0)
    Exit
}

[void]${sunvalley-srw}.ShowDialog()
