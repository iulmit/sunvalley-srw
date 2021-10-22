Imports System.IO
Imports System.IO.Compression
Imports System.Net
Imports System.Security.Principal

Module GetCurrentRole
    Public Function IsUserAdmin() As Boolean
        Dim User As New WindowsPrincipal(WindowsIdentity.GetCurrent())
        Dim CurrentRole As Boolean = User.IsInRole(WindowsBuiltInRole.Administrator)
        Return CurrentRole
    End Function
End Module

Module Zipper
    Public Function Extract(FileName As String, OutputPath As String) As String
        Dim InstallDir As String = Path.Combine(CStr(Environment.SpecialFolder.CommonProgramFilesX86 + CType(OutputPath, Environment.SpecialFolder)))
        If System.IO.Directory.Exists(InstallDir) Then
            Dim Message = "The directory " + OutputPath + " already exists. Do you want to reinstall it?"
            Dim Caption = "Warning"
            Dim ButtonLayout = MessageBoxButtons.YesNo
            Dim Icon = MessageBoxIcon.Warning
            Dim Result As DialogResult
            Result = MessageBox.Show(Message, Caption, ButtonLayout, Icon)
            If Result = DialogResult.Yes Then
                System.IO.Directory.Delete(OutputPath)
                If System.IO.File.Exists(FileName) Then
                    ZipFile.ExtractToDirectory(FileName, InstallDir)
                    If System.IO.Directory.Exists(OutputPath) Then
                        MessageBox.Show("Installation successful", FileName, MessageBoxButtons.OK, MessageBoxIcon.Information)
                    End If
                End If
            End If
        End If
        Return CStr(True)
    End Function
End Module

Module DependenciesChecker
    Public Function IsWingetInstalled() As Boolean
        Dim LocalWindowsAppsDir As String = Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData) + "\Microsoft\WindowsApps\"
        Dim ExecutableExists As Boolean
        If System.IO.File.Exists(LocalWindowsAppsDir + "winget.exe") Then
            ExecutableExists = True
        Else
            ExecutableExists = False
        End If
        Return ExecutableExists
    End Function
End Module

Module ProgramsChecker
    Public Function IsItInstalled(directory As String, executable As String) As Boolean
        Dim ProgramFilesDirX86 As String = Environment.GetFolderPath(Environment.SpecialFolder.CommonProgramFilesX86) + directory
        Dim ProgramFilesDir As String = Environment.GetFolderPath(Environment.SpecialFolder.CommonProgramFiles) + directory
        Dim ExecutableExists As Boolean
        If System.IO.File.Exists(ProgramFilesDirX86 + executable) Then
            ExecutableExists = True
        ElseIf System.IO.File.Exists(ProgramFilesDir + executable) Then
            ExecutableExists = True
        Else
            ExecutableExists = False
        End If
        Return ExecutableExists
    End Function
End Module

Public Class Container

    Private Sub Container_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        If GetCurrentRole.IsUserAdmin() = False Then
            Dim Message = "Some functionalities have been blocked because this program was not executed As Administrator."
            Dim Caption = "Low privileges"
            Dim ButtonLayout = MessageBoxButtons.OK
            Dim Icon = MessageBoxIcon.Warning
            MessageBox.Show(Message, Caption, ButtonLayout, Icon)
        End If
    End Sub

    Private Sub Programs_CheckForUpdates_Click(sender As Object, e As EventArgs) Handles Programs_CheckForUpdates.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Dim Message = "Are you sure you want to update winget sources?"
            Dim Caption = "Warning"
            Dim ButtonLayout = MessageBoxButtons.YesNo
            Dim Icon = MessageBoxIcon.Warning
            Dim Result As DialogResult
            Result = MessageBox.Show(Message, Caption, ButtonLayout, Icon)
            If Result = DialogResult.Yes Then
                Process.Start("powershell.exe", "winget source update")
            Else
                MessageBox.Show("Will Not check For updates.", "Update cancelled", MessageBoxButtons.OK, MessageBoxIcon.Information)
            End If
        End If
    End Sub

    Private Sub Programs_UpgradeAll_Click(sender As Object, e As EventArgs) Handles Programs_UpgradeAll.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Dim Message = "Are you sure you want to upgrade all winget packages?"
            Dim Caption = "Warning"
            Dim ButtonLayout = MessageBoxButtons.YesNo
            Dim Icon = MessageBoxIcon.Warning
            Dim Result As DialogResult
            Result = MessageBox.Show(Message, Caption, ButtonLayout, Icon)
            If Result = DialogResult.Yes Then
                Process.Start("powershell.exe", "winget upgrade --all")
            Else
                MessageBox.Show("Will not upgrade any packages.", "Upgrade cancelled", MessageBoxButtons.OK, MessageBoxIcon.Information)
            End If
        End If
    End Sub

    Private Sub Programs_Install_Winget_Click(sender As Object, e As EventArgs) Handles Programs_Install_Winget.Click
        If DependenciesChecker.IsWingetInstalled() = True Then
            MessageBox.Show("Windows Package Manager (winget) is already installed on this system.", "Already installed", MessageBoxButtons.OK, MessageBoxIcon.Information)
        Else
            Process.Start("powershell.exe", "Start-Process ms-appinstaller:?source=https://aka.ms/getwinget")
        End If
    End Sub

    Private Sub Programs_Install_7zip_Click(sender As Object, e As EventArgs) Handles Programs_Install_7zip.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install 7zip.7zip")
        End If
    End Sub

    Private Sub Programs_Install_Steam_Click(sender As Object, e As EventArgs) Handles Programs_Install_Steam.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install Valve.Steam")
        End If
    End Sub

    Private Sub Programs_Install_Egl_Click(sender As Object, e As EventArgs) Handles Programs_Install_EpicGamesLauncher.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install EpicGames.EpicGamesLauncher")
        End If
    End Sub

    Private Sub Programs_Install_EaDesktop_Click(sender As Object, e As EventArgs) Handles Programs_Install_EaDesktop.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install ElectronicArts.EADesktop")
        End If
    End Sub

    Private Sub Programs_Install_Discord_Click(sender As Object, e As EventArgs) Handles Programs_Install_Discord.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install Discord.Discord")
        End If
    End Sub

    Private Sub Programs_Install_SnappyDriverInstaller_Click(sender As Object, e As EventArgs) Handles Programs_Install_SnappyDriverInstaller.Click
        If GetCurrentRole.IsUserAdmin() = True Then
            Using webClient As New WebClient()
                webClient.Headers.Add(CStr(HttpRequestHeader.Cookie))
                webClient.DownloadFile("http://sdi-tool.org/releases/SDI_R2102.zip", "SDI_R2102.zip")
            End Using
            Zipper.Extract("SDI_R2102.zip", "Snappy Driver Installer")
        Else
            MessageBox.Show("You need Administrator privileges to install this application.", "Access denied", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End If
    End Sub

    Private Sub Programs_Install_Gimp_Click(sender As Object, e As EventArgs) Handles Programs_Install_Gimp.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install GIMP.GIMP")
        End If
    End Sub

    Private Sub Programs_Install_KDE_Connect_Click(sender As Object, e As EventArgs) Handles Programs_Install_KdeConnect.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install KDE.KDEConnect")
        End If
    End Sub

    Private Sub Programs_Install_Android_Studio_Click(sender As Object, e As EventArgs) Handles Programs_Install_AndroidStudio.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install Google.AndroidStudio")
        End If
    End Sub

    Private Sub Programs_Install_Brave_Click(sender As Object, e As EventArgs) Handles Programs_Install_Brave.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install BraveSoftware.BraveBrowser")
        End If
    End Sub

    Private Sub Programs_Install_Microsoft_Teams_Click(sender As Object, e As EventArgs) Handles Programs_Install_MicrosoftTeams.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install Microsoft.Teams")
        End If
    End Sub

    Private Sub Programs_Install_TelegramDesktop_Click(sender As Object, e As EventArgs) Handles Programs_Install_TelegramDesktop.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install Telegram.TelegramDesktop")
        End If
    End Sub

    Private Sub Programs_Install_VsCodium_Click(sender As Object, e As EventArgs) Handles Programs_Install_VsCodium.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install VSCodium.VSCodium")
        End If
    End Sub

    Private Sub Programs_Install_VsCode_Click(sender As Object, e As EventArgs) Handles Programs_Install_VsCode.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install Microsoft.VisualStudioCode")
        End If
    End Sub

    Private Sub Programs_Install_GithubDesktop_Click(sender As Object, e As EventArgs) Handles Programs_Install_GithubDesktop.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install GitHub.GitHubDesktop")
        End If
    End Sub

    Private Sub Programs_Install_Skype_Click(sender As Object, e As EventArgs) Handles Programs_Install_Skype.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install Microsoft.Skype")
        End If
    End Sub

    Private Sub Programs_Install_WindowsTerminal_Click(sender As Object, e As EventArgs) Handles Programs_Install_WindowsTerminal.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install Microsoft.WindowsTerminal")
        End If
    End Sub

    Private Sub Programs_Install_BleachBit_Click(sender As Object, e As EventArgs) Handles Programs_Install_BleachBit.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install Bleachbit.Bleachbit")
        End If
    End Sub

    Private Sub Programs_Install_Xampp_Click(sender As Object, e As EventArgs) Handles Programs_Install_Xampp.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell", "winget install ApacheFriends.Xampp")
        End If
    End Sub

    Private Sub Programs_Install_Spotify_Click(sender As Object, e As EventArgs) Handles Programs_Install_Spotify.Click
        If GetCurrentRole.IsUserAdmin() = False Then
            Process.Start("powershell", "winget install Spotify.Spotify")
        Else
            MessageBox.Show("Cannot install this program with Administrator privileges. Try again as a normal user.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End If
    End Sub

    Private Sub Programs_Install_Transmission_Click(sender As Object, e As EventArgs) Handles Programs_Install_Transmission.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install Transmission.Transmission")
        End If
    End Sub

    Private Sub Programs_Install_GoogleDrive_Click(sender As Object, e As EventArgs) Handles Programs_Install_GoogleDrive.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install Google.Drive")
        End If
    End Sub

    Private Sub Programs_Install_OneDrive_Click(sender As Object, e As EventArgs) Handles Programs_Install_OneDrive.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install Microsoft.OneDrive")
        End If
    End Sub

    Private Sub Programs_Install_CrystalDiskInfo_Click(sender As Object, e As EventArgs) Handles Programs_Install_CrystalDiskInfo.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install CrystalDewWorld.CrystalDiskInfo")
        End If
    End Sub

    Private Sub Programs_Install_InnoSetup_Click(sender As Object, e As EventArgs) Handles Programs_Install_InnoSetup.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install JRSoftware.InnoSetup")
        End If
    End Sub

    Private Sub Programs_Install_Bitwarden_Click(sender As Object, e As EventArgs) Handles Programs_Install_Bitwarden.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install Bitwarden.Bitwarden")
        End If
    End Sub

    Private Sub Programs_Install_VisualStudio2019Community_Click(sender As Object, e As EventArgs) Handles Programs_Install_VisualStudio2019Community.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install Microsoft.VisualStudio.2019.Community")
        End If
    End Sub

    Private Sub Programs_Install_VisualStudio2019Enterprise_Click(sender As Object, e As EventArgs) Handles Programs_Install_VisualStudio2019Enterprise.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install Microsoft.VisualStudio.2019.Enterprise")
        End If
    End Sub

    Private Sub Programs_Install_GeForce_Now_Click(sender As Object, e As EventArgs) Handles Programs_Install_GeForce_Now.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install Nvidia.GeForceNow")
        End If
    End Sub

    Private Sub Programs_Install_GeForce_Experience_Click(sender As Object, e As EventArgs) Handles Programs_Install_GeForce_Experience.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install Nvidia.GeForceExperience")
        End If
    End Sub

    Private Sub Programs_Install_AMD_Ryzen_Master_Click(sender As Object, e As EventArgs) Handles Programs_Install_AMD_Ryzen_Master.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install AMD.RyzenMaster")
        End If
    End Sub

    Private Sub Programs_Install_mRemoteNG_Click(sender As Object, e As EventArgs) Handles Programs_Install_mRemoteNG.Click
        If DependenciesChecker.IsWingetInstalled() = False Then
            MessageBox.Show("Windows Package Manager (winget) was not found on this system. Please install it and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        Else
            Process.Start("powershell.exe", "winget install mRemoteNG.mRemoteNG")
        End If
    End Sub

    Private Sub Programs_Install_LightShot_Click(sender As Object, e As EventArgs) Handles Programs_Install_LightShot.Click
        If GetCurrentRole.IsUserAdmin() = True Then
            If ProgramsChecker.IsItInstalled("\Skillbrains\lightshot", "Lightshot.exe") = False Then
                Process.Start("powershell.exe", "Write-Host Downloading LightShot...; Invoke-WebRequest -Uri https://app.prntscr.com/build/setup-lightshot.exe -OutFile $env:TEMP/setup-lightshot.exe -UseBasicParsing; cd $env:TEMP; .\setup-lightshot.exe /SILENT /NORESTART; cd $PSScriptRoot")
            Else
                MessageBox.Show("This program is already installed. Do you want to reinstall it?", "Already installed", MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation)
            End If
        Else
            MessageBox.Show("You need Administrator privileges to do this.", "Access denied", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End If
    End Sub

    Private Sub SystemAdministration_SystemReadiness_Click(sender As Object, e As EventArgs) Handles SystemAdministration_SystemReadiness.Click
        Dim Message = "System Readiness is likely to break the system to the point where only power users will be able to use it. Are you sure you want to continue?"
        Dim Caption = "Warning"
        Dim ButtonLayout = MessageBoxButtons.YesNo
        Dim Icon = MessageBoxIcon.Warning
        Dim Result As DialogResult
        Result = MessageBox.Show(Message, Caption, ButtonLayout, Icon)
        If Result = DialogResult.Yes Then
            If GetCurrentRole.IsUserAdmin() = True Then
                Process.Start("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/mrkenhoo/sunvalley-srw/main/modules/ApplySystemReadiness.ps1'))")
            Else
            MessageBox.Show("You need Administrator privileges to do this.", "Access denied", MessageBoxButtons.OK, MessageBoxIcon.Error)
            End If
        End If
    End Sub

    Private Sub SystemAdministration_SystemReadinessLite_Click(sender As Object, e As EventArgs) Handles SystemAdministration_SystemReadinessLite.Click
        Dim Message = "System Readiness Lite is a stripped down version which only configures group policies on the system. This is the recommended option for almost everyone. Do you want to continue?"
        Dim Caption = "Information"
        Dim ButtonLayout = MessageBoxButtons.YesNo
        Dim Icon = MessageBoxIcon.Information
        Dim Result As DialogResult
        Result = MessageBox.Show(Message, Caption, ButtonLayout, Icon)
        If Result = DialogResult.Yes Then
            If GetCurrentRole.IsUserAdmin() = True Then
                Process.Start("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/mrkenhoo/sunvalley-srw/main/modules/ApplySystemReadinessLite.ps1'))")
            Else
                MessageBox.Show("You need Administrator privileges to do this.", "Access denied", MessageBoxButtons.OK, MessageBoxIcon.Error)
            End If
        End If
    End Sub

    Private Sub SystemAdministration_RemoveAllUwpApps_Click(sender As Object, e As EventArgs) Handles SystemAdministration_RemoveAllUwpApps.Click
        Dim Message = "This will break your system somehow and so it's only recommended to power users. Are you sure you want to continue?"
        Dim Caption = "Warning"
        Dim ButtonLayout = MessageBoxButtons.YesNo
        Dim Icon = MessageBoxIcon.Warning
        Dim Result As DialogResult
        Result = MessageBox.Show(Message, Caption, ButtonLayout, Icon)
        If Result = DialogResult.Yes Then
            If GetCurrentRole.IsUserAdmin() = True Then
                Process.Start("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/mrkenhoo/sunvalley-srw/main/modules/RemoveAllUwpApps.ps1'))")
            Else
                MessageBox.Show("You need Administrator privileges to do this.", "Access denied", MessageBoxButtons.OK, MessageBoxIcon.Error)
            End If
        End If
    End Sub

    Private Sub SystemAdministration_RemoveAllNonCriticalUwpApps_Click(sender As Object, e As EventArgs) Handles SystemAdministration_RemoveAllNonCriticalUwpApps.Click
        If GetCurrentRole.IsUserAdmin() = True Then
            Process.Start("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/mrkenhoo/sunvalley-srw/main/modules/RemoveAllNonCriticalUwpApps.ps1'))")
        Else
            MessageBox.Show("You need Administrator privileges to do this.", "Access denied", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End If
    End Sub

    Private Sub SystemAdministration_ReinstallAllUwpApps_Click(sender As Object, e As EventArgs) Handles SystemAdministration_ReinstallAllUwpApps.Click
        If GetCurrentRole.IsUserAdmin() = True Then
            Process.Start("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/mrkenhoo/sunvalley-srw/main/modules/ReinstallAllUwpApps.ps1'))")
        Else
            MessageBox.Show("You need Administrator privileges to do this.", "Access denied", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End If
    End Sub

    Private Sub SystemAdministration_DisableAllWindowsFeatures_Click(sender As Object, e As EventArgs) Handles SystemAdministration_DisableAllWindowsOptionalFeatures.Click
        If GetCurrentRole.IsUserAdmin() = True Then
            Process.Start("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/mrkenhoo/sunvalley-srw/main/modules/DisableAllWindowsOptionalFeatures.ps1'))")
        Else
            MessageBox.Show("You need Administrator privileges to do this.", "Access denied", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End If
    End Sub

    Private Sub SystemAdministration_RemoveAllWindowsCapabilities_Click(sender As Object, e As EventArgs) Handles SystemAdministration_RemoveAllWindowsCapabilities.Click
        If GetCurrentRole.IsUserAdmin() = True Then
            Process.Start("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/mrkenhoo/sunvalley-srw/main/modules/RemoveAllWindowsCapabilities.ps1'))")
        Else
            MessageBox.Show("You need Administrator privileges to do this.", "Access denied", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End If
    End Sub

    Private Sub ThirdParty_CttWin10script_Click(sender As Object, e As EventArgs) Handles ThirdParty_Cttwin10script.Click
        If GetCurrentRole.IsUserAdmin() = True Then
            Process.Start("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/JJ8R4'))")
        Else
            MessageBox.Show("You need Administrator privileges to execute this script.", "Access denied", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End If
    End Sub

    Private Sub ThirdParty_Simeononsecurity_Click(sender As Object, e As EventArgs) Handles ThirdParty_Simeononsecurity.Click
        Dim Message = "This script will harden your system's security as much as possible, only recommended to power users. Are you sure you want to continue?"
        Dim Caption = "Warning"
        Dim ButtonLayout = MessageBoxButtons.YesNo
        Dim Icon = MessageBoxIcon.Warning
        Dim Result As DialogResult
        Result = MessageBox.Show(Message, Caption, ButtonLayout, Icon)
        If Result = DialogResult.Yes Then
            If GetCurrentRole.IsUserAdmin() = True Then
                Process.Start("powershell.exe", "iwr -useb 'https://simeononsecurity.ch/scripts/windowsoptimizeandharden.ps1'|iex")
            Else
                MessageBox.Show("You need Administrator privileges to execute this script.", "Access denied", MessageBoxButtons.OK, MessageBoxIcon.Error)
            End If
        End If
    End Sub

End Class
