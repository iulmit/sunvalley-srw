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

${ProgramsSetup_Install_Vscodium}                               = New-Object System.Windows.Forms.Button
${ProgramsSetup_Install_Vscodium}.Text                          = "Install VSCodium"
${ProgramsSetup_Install_Vscodium}.AutoSize                      = $true
${ProgramsSetup_Install_Vscodium}.Location                      = New-Object System.Drawing.Point(20,480)
${ProgramsSetup_Install_Vscodium}.Font                          = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${ProgramsSetup_Download_NVCleanstall}                          = New-Object System.Windows.Forms.Button
${ProgramsSetup_Download_NVCleanstall}.Text                     = "Download NVCleanstall"
${ProgramsSetup_Download_NVCleanstall}.AutoSize                 = $true
${ProgramsSetup_Download_NVCleanstall}.Location                 = New-Object System.Drawing.Point(20,530)
${ProgramsSetup_Download_NVCleanstall}.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',20)

${ProgramsSetup_Download_SDI}                                   = New-Object System.Windows.Forms.Button
${ProgramsSetup_Download_SDI}.Text                              = "Download SDI"
${ProgramsSetup_Download_SDI}.AutoSize                          = $true
${ProgramsSetup_Download_SDI}.Location                          = New-Object System.Drawing.Point(20,580)
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
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Install_7Zip}.Text)", 0x0)
})

${ProgramsSetup_Install_Steam}.Add_Click({
    Write-Host "Installing Steam... "
    winget install Valve.Steam -y
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Install_Steam}.Text)", 0x0)
})

${ProgramsSetup_Install_Egl}.Add_Click({
    Write-Host "Installing Epic Games Launcher... "
    winget install EpicGames.EpicGamesLauncher -y
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Install_Egl}.Text)", 0x0)
})

${ProgramsSetup_Install_EADesktop}.Add_Click({
    Write-Host "Installing EA Desktop... "
    choco install ElectronicArts.EADesktop -y
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Install_EADesktop}.Text)", 0x0)
})

${ProgramsSetup_Install_Spotify}.Add_Click({
    Write-Host "Installing Spotify... "
    winget install Spotify.Spotify -y
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Install_Spotify}.Text)", 0x0)
})

${ProgramsSetup_Install_Discord}.Add_Click({
    Write-Host "Installing Discord... "
    winget install Discord.Discord -y
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Install_Discord}.Text)", 0x0)
})

${ProgramsSetup_Install_Bleachbit}.Add_Click({
    Write-Host "Installing BleachBit... "
    winget install Bleachbit.BleachBit -y
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Install_Bleachbit}.Text)", 0x0)
})

${ProgramsSetup_Download_NVCleanstall}.Add_Click({
    Write-Host "Downloading NVCleanstall... "
    cd $env:TEMP; Invoke-WebRequest -Uri https://uk1-dl.techpowerup.com/files/716qQVTJyt_5PpcPdnZO7w/1627043545/NVCleanstall_1.10.0.exe -OutFile NVCleanstall.exe -ErrorAction Stop
    .\NVCleanstall.exe; cd $PSScriptRoot
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Download_NVCleanstall}.Text)", 0x0)
})

${ProgramsSetup_Install_Vscodium}.Add_Click({
    Write-Host "Installing VSCodium... "
    winget install VSCodium.VSCodium -y
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Install_Bleachbit}.Text)", 0x0)
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
    ${WShell}.Popup("Operation completed",0,"$(${ProgramsSetup_Download_SDI}.Text)", 0x0)
})

${SystemReadiness_Apply}.Add_Click({
    Switch ([System.Windows.Forms.MessageBox]::Show("System Readiness is not made for everyone as it breaks functionalities which are useful to people. Are you sure you want to continue?", "$($SystemReadiness_Apply.Text)",[System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Warning)) {
        Yes {
            Write-Host "==> Disabling system restore points..."
            Enable-ComputerRestore -Drive "$env:SystemDrive\"

            ### Telemetry ###
            Write-Host "==> Turning off telemetry..."
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
            Start-BitsTransfer -Source "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe" -Destination $($env:TEMP)\OOSU10.exe 2>&1
                
            Write-Host "    --> Downloading gfelipe099's O&O ShutUp10 privacy file..."
            Start-BitsTransfer -Source "https://raw.githubusercontent.com/gfelipe099/threshold-srb/master/ooshutup10.cfg" -Destination $($env:TEMP)\ooshutup10.cfg 2>&1

            Write-Host "    --> Applying privacy policies from O&O ShutUp10 privacy file..."
            cd $env:TEMP; .\OOSU10.exe ooshutup10.cfg /quiet; cd $PSScriptRoot
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

            Switch ([System.Windows.Forms.MessageBox]::Show("Are you using a solid state drive (SSD)?", "$(${SystemReadiness_Apply}.Text)",[System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question)) {
                No {
                    Write-Host "    --> Stopping and disabling Superfetch service..."
                    Stop-Service "SysMain" -WarningAction SilentlyContinue
                    Set-Service "SysMain" -StartupType Disabled
                }
            }
            
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
            bcdedit /set ${current} nx AlwaysOn

            Write-Host "    --> Disabling auto reboot on system crash (BSOD)..."
            wmic recoveros set AutoReboot = False

            Write-Host "    --> Disabling system crash dumping..."
            wmic recoveros set DebugInfoType = 0

            Write-Host ""; Write-Host "    --> Windows optional features"
            $wof = (Get-WindowsOptionalFeature -FeatureName '*' -Online).FeatureName
            Write-Host ('        - Found ' + $wof.Count + ' Windows optional feature(s) on this system')
            $wof | ForEach-Object {
                Write-Host "            > Removing optional feature: $_..."
                Where-Object {$_ -notlike "*LegacyComponents*"} |
                Where-Object {$_ -notlike "*DirectPlay*"} |
                Where-Object {$_ -notlike "*NetFx3*"} |
                Where-Object {$_ -notlike "*NetFx4-Advsrvs*"} |
                Where-Object {$_ -notlike "*WCF-Services45*"} |
                Where-Object {$_ -notlike "*WCF-TCP-PortSharing45*"} |
                Where-Object {$_ -notlike "*Windows-Defender-Default-Definitions*"} |
                Disable-WindowsOptionalFeature -FeatureName $_ -Online -NoRestart -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
            }

            Write-Host ""; Write-Host "==> Windows capabilities"
            $wc = (Get-WindowsCapability -Online).Name
            Write-Host ('        - Found ' + $wc.Count + ' Windows capabilitities...')
            $wc | ForEach-Object {
                Write-Host "            > Removing capatiblity: $_..."
                Where-Object {$_ -notlike "*Notepad*"} | Remove-WindowsCapability -Name $_ -Online -ErrorAction SilentlyContinue -WarningAction SilentlyContinue 2>&1
            }

            Write-Host "==> Uninstalling UWP apps except critical ones..."
            Get-AppxPackage -AllUsers | Where-Object {$_.name -notlike "*Microsoft.WindowsStore*"} | Where-Object {$_.name -notlike "*AppUp.IntelGraphicsExperience*"} | Where-Object {$_.name -notlike "*NVIDIACorp.NVIDIAControlPanel*"} | Where-Object {$_.name -notlike "*RealtekSemiconductorCorp.RealtekAudioControl*"} | Where-Object {$_.name -notlike "*Microsoft.VCLibs.140.00.UWPDesktop*"} | Remove-AppxPackage -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
            Get-AppxProvisionedPackage -Online | Where-Object {$_.name -notlike "*Microsoft.WindowsStore*"} | Where-Object {$_.name -notlike "*AppUp.IntelGraphicsExperience*"} | Where-Object {$_.name -notlike "*NVIDIACorp.NVIDIAControlPanel*"} | Where-Object {$_.name -notlike "*RealtekSemiconductorCorp.RealtekAudioControl*"} | Where-Object {$_.name -notlike "*Microsoft.VCLibs.140.00.UWPDesktop*"} | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue -WarningAction SilentlyContinue

            Write-Warning "The following UWP apps were left untouched: Windows Store, NVIDIA Control Panel, Realtek Audio Console and Intel Graphics Command Center, VCLibs.140.00.UWPDesktop"

            Switch ([System.Windows.Forms.MessageBox]::Show("Do you want to harden the security of your system?", "$(${SystemReadiness_Apply}.Text)",[System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question)) {
            Yes {
                Write-Host "When prompted to reboot your system, select 'No'"
                Start-Sleep 2
                iwr -useb 'https://simeononsecurity.ch/scripts/windowsoptimizeandharden.ps1' | iex
            }
            No {
                Write-Host "No extra changes were made to your system"
            }
        }
    
        if (!${systemReadinessExecuted}) {
            New-Variable -Name systemReadinessExecuted -Value 1 2>&1
        }

        ${WShell}.Popup("Operation completed",16,"$(${SystemReadiness_Apply}.Text)", 0x0)
        }
    }
})

${SystemReadiness_RemoveAllUwpApps}.Add_Click({
    Write-Host "==> Uninstalling UWP apps..."
    Get-AppxPackage -AllUsers | Remove -AppxPackage -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
    Get-AppxProvisionedPackage -Online | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
})

${SystemReadiness_ReinstallAllUwpApps}.Add_Click({
    if ($systemReadinessExecuted = 1) {
        Write-Error "==> System Readiness was executed. You cannot continue"
        Start-Sleep 5
        Exit
    } else {
        Write-Host "==> Reinstalling UWP apps..."
        Get-AppxPackage -AllUsers | ForEach {Add-AppxPackage -Register "$($env:ProgramFiles)\WindowsApps\$_\AppxManifest.xml" -DisableDevelopmentMode} -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
        Get-AppxProvisionedPackage -Online | ForEach {Add-AppxProvisionedPackage -Online -Register "$($env:ProgramFiles)\WindowsApps\$_\AppxManifest.xml" -DisableDevelopmentMode} -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
    }
})

${ThirdpartyContainer_CttWin10script}.Add_Click({
    Clear-Host
    iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/JJ8R4'))
})

${sunvalley-srw}.Controls.AddRange(@(${ProgramsContainer},${SystemAdministration},${ThirdpartyContainer}))
${ProgramsContainer}.Controls.AddRange(@(${ProgramsSetup},${ProgramsSetup_Install_7zip},${ProgramsSetup_Install_Steam},${ProgramsSetup_Install_Egl},${ProgramsSetup_Install_EADesktop},${ProgramsSetup_Install_Spotify},${ProgramsSetup_Install_Discord},${ProgramsSetup_Install_Bleachbit},${ProgramsSetup_Install_Powertoys},${ProgramsSetup_Install_Vscodium},${ProgramsSetup_Install_Telegramdesktop},${ProgramsSetup_Download_NVCleanstall}))
${SystemAdministration}.Controls.AddRange(@(${SystemReadiness},${SystemReadiness_Apply},${SystemReadiness_RemoveAllUwp},${SystemReadiness_RemoveAllUwpApps},${SystemReadiness_RemoveUwpApps},${SystemReadiness_ReinstallAllUwpApps}))
${ThirdpartyContainer}.Controls.AddRange(@(${ThirdpartyContainer_Label},${ThirdpartyContainer_CttWin10script}))

if (${OsEdition} -ne "${validatedOsEdition}") {
    Switch ([System.Windows.Forms.MessageBox]::Show("The OS edition you are using is not validated on this script. You need to use ${validatedOsEdition}, and you are using ${OsEdition}. Do you want to continue anyway?", "$(${sunvalley-srw}.Text)",[System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Error)) {
        No {
            Write-Error "The user cancelled the execution"
            Start-Sleep 5
            Exit
        }
    }
}

if (${OsEdition} -ne "${validatedOsEdition}") {
    Switch ([System.Windows.Forms.MessageBox]::Show("Your version of Windows is not validated on this script. You need to use ${validatedOsVersion}, and you are using ${OsVersion}. Do you want to continue anyway?", "$(${sunvalley-srw}.Text)",[System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Error)) {
        No {
            Write-Error "The user cancelled the execution"
            Start-Sleep 5
            Exit
        }
    }
}

[void]${sunvalley-srw}.ShowDialog()
