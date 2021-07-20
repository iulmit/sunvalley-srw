#
# Created by Liam Powell (gfelipe099)
# A fork from ChrisTitusTech's https://github.com/ChrisTitusTech/win10script
# sunvalley-srw.ps1 file
# System Readiness for Workstations
# For Microsoft Windows 11 Pro N for Workstations x64
#
Clear-Host

### Check system version and edition ###
if (!${validatedOsVersion}) {
    New-Variable -Name validatedOsVersion -Value "10.0.22000" 2>&1
}

if (!${validatedOsEdition}) {
    New-Variable -Name validatedOsEdition -Value "Microsoft Windows 11 Pro N for Workstations" 2>&1
}

if (!${OsVersion}) {
    New-Variable -Name osVersion -Value (gwmi win32_operatingsystem).version 2>&1
}

if (!${OsEdition}) {
    New-Variable -Name osEdition -Value (gwmi win32_operatingsystem).caption 2>&1
}

${WShell} = New-Object -ComObject Wscript.Shell
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()
    If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
        Switch ([System.Windows.Forms.MessageBox]::Show("This script needs Administrator privileges to run. Do you want to give permissions to this script?", "Insufficient permissions",[System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Warning)) {
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
${sunvalley-srw}.ClientSize                                     = New-Object System.Drawing.Point(1024,768)
${sunvalley-srw}.Text                                           = "System Readiness for Workstations"
${sunvalley-srw}.TopMost                                        = $false
${sunvalley-srw}.AutoScaleMode                                  = "Dpi"
${sunvalley-srw}.FormBorderStyle                                = "FixedSingle"
${sunvalley-srw}.StartPosition                                  = "CenterScreen"

${ProgramsContainer}                                            = New-Object System.Windows.Forms.Panel
${ProgramsContainer}.AutoSize                                   = $true

${ProgramsSetup}                                                = New-Object System.Windows.Forms.Label
${ProgramsSetup}.Text                                           = "Programs"
${ProgramsSetup}.AutoSize                                       = $true
${ProgramsSetup}.Location                                       = New-Object System.Drawing.Point(10,15)
${ProgramsSetup}.Font                                           = New-Object System.Drawing.Font('Microsoft Sans Serif',30)

${ProgramsSetup_Install_7zip}                                   = New-Object System.Windows.Forms.Button
${ProgramsSetup_Install_7zip}.Text                              = "Install 7-Zip"
${ProgramsSetup_Install_7zip}.AutoSize                          = $true
${ProgramsSetup_Install_7zip}.Location                          = New-Object System.Drawing.Point(20,80)
${ProgramsSetup_Install_7zip}.Font                              = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${ProgramsSetup_Install_Steam}                                  = New-Object System.Windows.Forms.Button
${ProgramsSetup_Install_Steam}.Text                             = "Install Steam"
${ProgramsSetup_Install_Steam}.AutoSize                         = $true
${ProgramsSetup_Install_Steam}.Location                         = New-Object System.Drawing.Point(20,130)
${ProgramsSetup_Install_Steam}.Font                             = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${ProgramsSetup_Install_Egl}                                    = New-Object System.Windows.Forms.Button
${ProgramsSetup_Install_Egl}.Text                               = "Install Epic Games Launcher"
${ProgramsSetup_Install_Egl}.AutoSize                           = $true
${ProgramsSetup_Install_Egl}.Location                           = New-Object System.Drawing.Point(20,180)
${ProgramsSetup_Install_Egl}.Font                               = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${ProgramsSetup_Install_EADesktop}                              = New-Object System.Windows.Forms.Button
${ProgramsSetup_Install_EADesktop}.Text                         = "Install EA Desktop (Beta)"
${ProgramsSetup_Install_EADesktop}.AutoSize                     = $true
${ProgramsSetup_Install_EADesktop}.Location                     = New-Object System.Drawing.Point(20,230)
${ProgramsSetup_Install_EADesktop}.Font                         = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${ProgramsSetup_Install_Spotify}                                = New-Object System.Windows.Forms.Button
${ProgramsSetup_Install_Spotify}.Text                           = "Install Spotify"
${ProgramsSetup_Install_Spotify}.AutoSize                       = $true
${ProgramsSetup_Install_Spotify}.Location                       = New-Object System.Drawing.Point(20,280)
${ProgramsSetup_Install_Spotify}.Font                           = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${ProgramsSetup_Install_Discord}                                = New-Object System.Windows.Forms.Button
${ProgramsSetup_Install_Discord}.Text                           = "Install Discord"
${ProgramsSetup_Install_Discord}.AutoSize                       = $true
${ProgramsSetup_Install_Discord}.Location                       = New-Object System.Drawing.Point(20,330)
${ProgramsSetup_Install_Discord}.Font                           = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${ProgramsSetup_Install_Bleachbit}                              = New-Object System.Windows.Forms.Button
${ProgramsSetup_Install_Bleachbit}.Text                         = "Install BleachBit"
${ProgramsSetup_Install_Bleachbit}.AutoSize                     = $true
${ProgramsSetup_Install_Bleachbit}.Location                     = New-Object System.Drawing.Point(20,380)
${ProgramsSetup_Install_Bleachbit}.Font                         = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${ProgramsSetup_Install_Powertoys}                              = New-Object System.Windows.Forms.Button
${ProgramsSetup_Install_Powertoys}.Text                         = "Install PowerToys (Preview)"
${ProgramsSetup_Install_Powertoys}.AutoSize                     = $true
${ProgramsSetup_Install_Powertoys}.Location                     = New-Object System.Drawing.Point(20,430)
${ProgramsSetup_Install_Powertoys}.Font                         = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${ProgramsSetup_Download_NVCleanstall}                          = New-Object System.Windows.Forms.Button
${ProgramsSetup_Download_NVCleanstall}.Text                     = "Download NVCleanstall"
${ProgramsSetup_Download_NVCleanstall}.AutoSize                 = $true
${ProgramsSetup_Download_NVCleanstall}.Location                 = New-Object System.Drawing.Point(20,480)
${ProgramsSetup_Download_NVCleanstall}.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${ProgramsSetup_Download_SDI}                                   = New-Object System.Windows.Forms.Button
${ProgramsSetup_Download_SDI}.Text                              = "Download SDI"
${ProgramsSetup_Download_SDI}.AutoSize                          = $true
${ProgramsSetup_Download_SDI}.Location                          = New-Object System.Drawing.Point(20,530)
${ProgramsSetup_Download_SDI}.Font                              = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

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
${SystemReadiness_RemoveUwpApps}.Location                       = New-Object System.Drawing.Point(570,130)
${SystemReadiness_RemoveUwpApps}.Font                           = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${SystemReadiness_RemoveAllUwpApps}                             = New-Object System.Windows.Forms.Button
${SystemReadiness_RemoveAllUwpApps}.Text                        = "Remove all UWP apps"
${SystemReadiness_RemoveAllUwpApps}.AutoSize                    = $true
${SystemReadiness_RemoveAllUwpApps}.Location                    = New-Object System.Drawing.Point(570,180)
${SystemReadiness_RemoveAllUwpApps}.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${SystemReadiness_ReinstallAllUwpApps}                          = New-Object System.Windows.Forms.Button
${SystemReadiness_ReinstallAllUwpApps}.Text                     = "Reinstall all UWP apps"
${SystemReadiness_ReinstallAllUwpApps}.AutoSize                 = $true
${SystemReadiness_ReinstallAllUwpApps}.Location                 = New-Object System.Drawing.Point(570,230)
${SystemReadiness_ReinstallAllUwpApps}.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

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

${ProgramsSetup_Install_7Zip}.Add_Click({
    Write-Host "Installing 7-Zip... "
    winget install 7zip.7zip -y
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Install_7Zip}.Text)",0x0)
})

${ProgramsSetup_Install_Steam}.Add_Click({
    Write-Host "Installing Steam... "
    winget install Valve.Steam -y
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Install_Steam}.Text)",0x0)
})

${ProgramsSetup_Install_Egl}.Add_Click({
    Write-Host "Installing Epic Games Launcher... "
    winget install EpicGames.EpicGamesLauncher -y
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Install_Egl}.Text)",0x0)
})

${ProgramsSetup_Install_EADesktop}.Add_Click({
    Write-Host "Installing EA Desktop... "
    choco install ElectronicArts.EADesktop -y
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Install_EADesktop}.Text)",0x0)
})

${ProgramsSetup_Install_Spotify}.Add_Click({
    Write-Host "Installing Spotify... "
    winget install Spotify.Spotify -y
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Install_Spotify}.Text)",0x0)
})

${ProgramsSetup_Install_Discord}.Add_Click({
    Write-Host "Installing Discord... "
    winget install Discord.Discord -y
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Install_Discord}.Text)",0x0)
})

${ProgramsSetup_Install_Bleachbit}.Add_Click({
    Write-Host "Installing BleachBit... "
    winget install Bleachbit.BleachBit -y
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Install_Bleachbit}.Text)",0x0)
})

${ProgramsSetup_Download_NVCleanstall}.Add_Click({
    Write-Host "Downloading NVCleanstall... "
    Invoke-WebRequest -Uri https://softpedia-secure-download.com/dl/6a1a1185bec4cf2a239a6ceaca9be800/60f2d693/100260222/software/portable/system/NVCleanstall_1.10.0.exe -OutFile $env:TEMP\NVCleanstall.exe -ErrorAction Stop
    .\$env:TEMP\NVCleanstall.exe
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Download_NVCleanstall}.Text)",0x0)
})

${ProgramsSetup_Install_Vscodium}.Add_Click({
    Write-Host "Installing VSCodium... "
    winget install VSCodium.VSCodium -y
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Install_Bleachbit}.Text)",0x0)
})

${ProgramsSetup_Download_SDI}.Add_Click({
    $programName = 'Snappy Driver Installer'
    $zipFile = 'SDI_R2102.zip'
    $installDir = "$env:ProgramFiles/Snappy Driver Installer"

    function unzipFile {
        #
        # Function source:
        # 'https://stackoverflow.com/questions/27768303/how-to-unzip-a-file-in-powershell'
        #
        param([string]$zipFile, [string]$outpath)
        [System.IO.Compression.ZipFile]::ExtractToDirectory($zipFile, $outpath)
    }

    if (-not(Test-Path -Path $zipFile -PathType Leaf)) {
        try {
            $null = Write-Host "Downloading Snappy Driver Installer..."
            Invoke-WebRequest -Uri http://sdi-tool.org/releases/$zipFile -OutFile $env:TEMP/$zipFile -UseBasicParsing -ErrorAction Stop 2>&1
            if (Test-Path -Path $env:TEMP/$zipFile -PathType Leaf) {
                Write-Host "'$programName' was downloaded successfully"
                Write-Host "Extracting '$programName' to '$installDir'..."
                unzipFile "$env:TEMP/$zipFile" "$installDir"
                if (Test-Path -Path "$installDir" -PathType Leaf) {
                    Write-Host "'$programName' was extracted successfully at '$installDir'"
                } else {
                    Write-Error "'$programName' is already extracted in the directory '$installDir' "
                }
            }
        }
        catch {
            throw $_.Exception.Message
        }
    } else {
        Write-Error "File '$zipFile' already exists, delete it and try again..."
    }
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Download_SDI}.Text)",0x0)
})

${SystemReadiness_Apply}.Add_Click({
    # Privacy settings
    Write-Host "Applying privacy settings..."
    Import-Module BitsTransfer 2>&1
    Start-BitsTransfer -Source "https://raw.githubusercontent.com/gfelipe099/threshold-srb/master/ooshutup10.cfg" -Destination ooshutup10.cfg 2>&1
    Start-BitsTransfer -Source "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe" -Destination OOSU10.exe 2>&1
    ./OOSU10.exe ooshutup10.cfg /quiet
    Remove-Module BitsTransfer

    # Performance settings
    Write-Host "Applying performance settings..."
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewAlphaSelect" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewShadow" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAnimations" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "IconsOnly" -Type DWord -Value 1
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Type DWord -Value 3
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\DWM" -Name "EnableAeroPeek" -Type DWord -Value 0

    # Interface settings
    Write-Host "Applying interface settings..."
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAl" -Type DWord -Value 0
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name SmartScreenEnabled -Value Block
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HiddenFileExt" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskBarButton" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowCortanaButton" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name "PeopleBand" -Type DWord -Value 0
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "DisableNotificationCenter" -Type DWord -Value 1
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" -Name "ToastEnabled" -Type DWord -Value 0

    # Miscellaneous settings
    Write-Host "Disabling Windows Error Reporting..."
    Disable-WindowsErrorReporting
    Write-Host "Disabling hibernation..."
    powercfg -h off
    Write-Host "Setting Data Execution Prevention (DEP) to 'AlwaysOn'..."
    bcdedit /set ${current} nx AlwaysOn
    Write-Host "Disabling auto reboot on system crash (BSOD)..."
    wmic recoveros set AutoReboot = False
    Write-Host "Disabling system crash dumping..."
    wmic recoveros set DebugInfoType = 0

    # Windows optional features
    $wof = (Get-WindowsOptionalFeature -FeatureName '*' -Online).FeatureName
    Write-Host ('Disabling ' + $wof.Count + ' Windows optional features...')
    $wof | ForEach-Object {
        Where-Object {$_ -notlike "*LegacyComponents*"} |\
        Where-Object {$_ -notlike "*DirectPlay*"} |\
        Where-Object {$_ -notlike "*NetFx3*"} |\
        Where-Object {$_ -notlike "*NetFx4-Advsrvs*"} |\
        Where-Object {$_ -notlike "*WCF-Services45*"} |\
        Where-Object {$_ -notlike "*WCF-TCP-PortSharing45*"} |\
        Where-Object {$_ -notlike "*Windows-Defender-Default-Definitions*"} |\
        Disable-WindowsOptionalFeature -FeatureName $_ -Online -NoRestart -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
    }

    # Windows capabilities
    $wc = (Get-WindowsCapability -Online).Name
    Write-Host ('Removing ' + $wc.Count + ' Windows capabilities...')
    $wc | ForEach-Object {
        Where-Object {$_ -notlike "*Notepad*"} | Remove-WindowsCapability -Name $_ -Online -ErrorAction SilentlyContinue -WarningAction SilentlyContinue 2>&1
    }
    Remove-Printer -Name "Fax" -ErrorAction SilentlyContinue 2>&1

    Write-Host "Uninstalling UWP apps except critical ones..."
    Get-AppxPackage -AllUsers | Where-Object {$_.name -notlike "*Microsoft.WindowsStore*"} | Where-Object {$_.name -notlike "*AppUp.IntelGraphicsExperience*"} | Where-Object {$_.name -notlike "*NVIDIACorp.NVIDIAControlPanel*"} | Where-Object {$_.name -notlike "*RealtekSemiconductorCorp.RealtekAudioControl*"} | Where-Object {$_.name -notlike "*Microsoft.VCLibs*"} | Remove-AppxPackage -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
    Get-AppxProvisionedPackage -Online | Where-Object {$_.name -notlike "*Microsoft.WindowsStore*"} | Where-Object {$_.name -notlike "*AppUp.IntelGraphicsExperience*"} | Where-Object {$_.name -notlike "*NVIDIACorp.NVIDIAControlPanel*"} | Where-Object {$_.name -notlike "*RealtekSemiconductorCorp.RealtekAudioControl*"} | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
    Write-Warning "The following UWP apps were left untouched: Windows Store, NVIDIA Control Panel, Realtek Audio Console and Intel Graphics Command Center"

    ${WShell}.Popup("Operation completed",0,"$(${SystemReadiness_Apply}.Text)",0x0)
})

${SystemReadiness_RemoveAllUwpApps}.Add_Click({
    Write-Host "Uninstalling UWP apps..."
    Get-AppxPackage -AllUsers | Remove -AppxPackage -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
    Get-AppxProvisionedPackage -Online | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
})

${SystemReadiness_ReinstallAllUwpApps}.Add_Click({
    Write-Host "Reinstalling UWP apps..."
    Get-AppxPackage -AllUsers | ForEach {Add-AppxPackage -Register "$($_.InstallLocation)appxmanifest.xml" -DisableDevelopmentMode} -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
    Get-AppxPackage -AllUsers -Online | ForEach {Add-AppxPackage -Online -register "$($_.InstallLocation)appxmanifest.xml" -DisableDevelopmentMode} -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
})

${ThirdpartyContainer_CttWin10script}.Add_Click({
    Clear-Host
    iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/JJ8R4'))
})

${sunvalley-srw}.Controls.AddRange(@(${ProgramsContainer},${SystemAdministration},${ThirdpartyContainer}))
${ProgramsContainer}.Controls.AddRange(@(${ProgramsSetup},${ProgramsSetup_Install_7zip},${ProgramsSetup_Install_Steam},${ProgramsSetup_Install_Egl},${ProgramsSetup_Install_EADesktop},${ProgramsSetup_Install_Spotify},${ProgramsSetup_Install_Discord},${ProgramsSetup_Install_Bleachbit},${ProgramsSetup_Install_Powertoys},${ProgramsSetup_Install_Vscodium},${ProgramsSetup_Download_NVCleanstall}))
${SystemAdministration}.Controls.AddRange(@(${SystemReadiness},${SystemReadiness_Apply},${SystemReadiness_RemoveAllUwp},${SystemReadiness_RemoveAllUwpApps},${SystemReadiness_RemoveUwpApps},${SystemReadiness_ReinstallAllUwpApps}))
${ThirdpartyContainer}.Controls.AddRange(@(${ThirdpartyContainer_Label},${ThirdpartyContainer_CttWin10script}))

if (${OsEdition} -ne "${validatedOsEdition}") {
    ${WShell}.Popup("The OS edition you are using is not validated to use with this script. You need to use ${validatedOsEdition}, and you are using ${OsEdition}.",0,"$(${sunvalley-srw}.Text)",0x0)
    Exit
}

if (${OsVersion} -ne "${validatedOsVersion}") {
    ${WShell}.Popup("Your version of Windows is not validated on this script. You need to use ${validatedOsVersion}, and you are using ${OsVersion}.",0,"$(${sunvalley-srw}.Text)",0x0)
    Exit
}

[void]${sunvalley-srw}.ShowDialog()
