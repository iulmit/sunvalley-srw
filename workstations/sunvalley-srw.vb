Imports System.ComponentModel
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
    Public Function Extract(FileName, OutputPath)
        Dim InstallDir = Path.Combine(Environment.GetEnvironmentVariable("ProgramFiles") + OutputPath)
        If System.IO.Directory.Exists(OutputPath) Then
            Dim Message = "The directory " + OutputPath + " already exists. Do you want to reinstall it?"
            Dim Caption = "Warning"
            Dim ButtonLayout = MessageBoxButtons.YesNo
            Dim Icon = MessageBoxIcon.Warning
            Dim Result As DialogResult
            Result = MessageBox.Show(Message, Caption, ButtonLayout, Icon)
            If Result = DialogResult.Yes Then
                System.IO.Directory.Delete(InstallDir)
                If System.IO.File.Exists(FileName) Then
                    ZipFile.ExtractToDirectory(FileName, OutputPath)
                    If System.IO.Directory.Exists(InstallDir) Then
                        MessageBox.Show("Installation successful", FileName, MessageBoxButtons.OK, MessageBoxIcon.Information)
                    End If
                End If
            End If
        End If
        Return 0
    End Function
End Module

Public Class Container
    Private Sub Container_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        If GetCurrentRole.IsUserAdmin() = False Then
            Dim Message = "Some functionalities have been blocked because this program was not executed as Administrator."
            Dim Caption = "Low privileges"
            Dim ButtonLayout = MessageBoxButtons.OK
            Dim Icon = MessageBoxIcon.Warning
            MessageBox.Show(Message, Caption, ButtonLayout, Icon)
        End If
    End Sub

    Private Sub Updater_Click(sender As Object, e As EventArgs) Handles Programs_CheckForUpdates.Click
        Dim Message = "Are you sure you want to check for updates?"
        Dim Caption = "Warning"
        Dim ButtonLayout = MessageBoxButtons.YesNo
        Dim Icon = MessageBoxIcon.Warning
        Dim Result As DialogResult
        Result = MessageBox.Show(Message, Caption, ButtonLayout, Icon)
        If Result = DialogResult.Yes Then
            Updater.RunWorkerAsync()
        Else
            MessageBox.Show("Will not check for updates.", "Update cancelled", MessageBoxButtons.OK, MessageBoxIcon.Information)
        End If
    End Sub

    Private Sub Updater_ProgressChanged(sender As Object, e As ProgressChangedEventArgs) Handles Updater.ProgressChanged
        Updater.WorkerReportsProgress = e.ProgressPercentage
    End Sub

    Private Sub Updater_DoWork(sender As Object, e As DoWorkEventArgs) Handles Updater.DoWork
        If Updater.IsBusy = False Then
            Updater.RunWorkerAsync(Process.Start("powershell.exe", "winget sources update"))
        Else
            Dim Result As DialogResult
            Result = MessageBox.Show("Cannot check for updates now. Error code: UPDATER_IS_BUSY", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End If
    End Sub

    Private Sub Updater_RunWorkerDone(sender As Object, e As RunWorkerCompletedEventArgs) Handles Updater.RunWorkerCompleted
        Updater.Dispose()
    End Sub

    Private Sub Programs_Install_7zip_Click(sender As Object, e As EventArgs) Handles Programs_Install_7zip.Click
        Process.Start("powershell.exe", "winget install 7zip.7zip")
    End Sub

    Private Sub Programs_Install_Steam_Click(sender As Object, e As EventArgs) Handles Programs_Install_Steam.Click
        Process.Start("powershell.exe", "winget install Valve.Steam")
    End Sub

    Private Sub Programs_Install_Egl_Click(sender As Object, e As EventArgs) Handles Programs_Install_EpicGamesLauncher.Click
        Process.Start("powershell.exe", "winget install EpicGames.EpicGamesLauncher")
    End Sub

    Private Sub Programs_Install_EADesktop_Click(sender As Object, e As EventArgs) Handles Programs_Install_EaDesktop.Click
        Process.Start("powershell.exe", "winget install ElectronicArts.EADesktop")
    End Sub

    Private Sub Programs_Install_Discord_Click(sender As Object, e As EventArgs) Handles Programs_Install_Discord.Click
        Process.Start("powershell.exe", "winget install Discord.Discord")
    End Sub

    Private Sub Programs_Install_Sdi_Click(sender As Object, e As EventArgs) Handles Programs_Install_SnappyDriverInstaller.Click
        If GetCurrentRole.IsUserAdmin() = True Then
            Using webClient As New WebClient()
                webClient.Headers.Add(HttpRequestHeader.Cookie)
                webClient.DownloadFile("http://sdi-tool.org/releases/SDI_R2102.zip", "SDI_R2102.zip")
            End Using
            Zipper.Extract("SDI_R2102.zip", "Snappy Driver Installer")
        Else
            MessageBox.Show("You need Administrator privileges to install this application.", "Access denied", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End If
    End Sub

    Private Sub Programs_Install_Gimp_Click(sender As Object, e As EventArgs) Handles Programs_Install_Gimp.Click
        Process.Start("powershell.exe", "winget install GIMP.GIMP")
    End Sub

    Private Sub Programs_Install_KDE_Connect_Click(sender As Object, e As EventArgs) Handles Programs_Install_KdeConnect.Click
        Process.Start("powershell.exe", "winget install KDE.KDEConnect")
    End Sub

    Private Sub Programs_Install_Android_Studio_Click(sender As Object, e As EventArgs) Handles Programs_Install_AndroidStudio.Click
        Process.Start("powershell.exe", "winget install Google.AndroidStudio")
    End Sub

    Private Sub Programs_Install_Brave_Click(sender As Object, e As EventArgs) Handles Programs_Install_Brave.Click
        Process.Start("powershell.exe", "winget install BraveSoftware.BraveBrowser")
    End Sub

    Private Sub Programs_Install_Microsoft_Teams_Click(sender As Object, e As EventArgs) Handles Programs_Install_MicrosoftTeams.Click
        Process.Start("powershell.exe", "winget install Microsoft.Teams")
    End Sub

    Private Sub Programs_Install_TelegramDesktop_Click(sender As Object, e As EventArgs) Handles Programs_Install_TelegramDesktop.Click
        Process.Start("powershell.exe", "winget install Telegram.TelegramDesktop")
    End Sub

    Private Sub Programs_Install_VsCodium_Click(sender As Object, e As EventArgs) Handles Programs_Install_VsCodium.Click
        Process.Start("powershell.exe", "winget install VSCodium.VSCodium")
    End Sub

    Private Sub Programs_Install_VsCode_Click(sender As Object, e As EventArgs) Handles Programs_Install_VsCode.Click
        Process.Start("powershell.exe", "winget install Microsoft.VisualStudioCode")
    End Sub

    Private Sub Programs_Install_GithubDesktop_Click(sender As Object, e As EventArgs) Handles Programs_Install_GithubDesktop.Click
        Process.Start("powershell.exe", "winget install GitHub.GitHubDesktop")
    End Sub

    Private Sub Programs_Install_Skype_Click(sender As Object, e As EventArgs) Handles Programs_Install_Skype.Click
        Process.Start("powershell.exe", "winget install Microsoft.Skype")
    End Sub

    Private Sub Programs_Install_WindowsTerminal_Click(sender As Object, e As EventArgs) Handles Programs_Install_WindowsTerminal.Click
        Process.Start("powershell.exe", "winget install Microsoft.WindowsTerminal")
    End Sub

    Private Sub Programs_Install_BleachBit_Click(sender As Object, e As EventArgs) Handles Programs_Install_BleachBit.Click
        Process.Start("powershell.exe", "winget install Bleachbit.Bleachbit")
    End Sub

    Private Sub Programs_Install_Xampp_Click(sender As Object, e As EventArgs) Handles Programs_Install_Xampp.Click
        Process.Start("powershell", "winget install ApacheFriends.Xampp")
    End Sub

    Private Sub Programs_Install_Spotify_Click(sender As Object, e As EventArgs) Handles Programs_Install_Spotify.Click
        If GetCurrentRole.IsUserAdmin() = False Then
            Process.Start("powershell", "winget install Spotify.Spotify")
        Else
            MessageBox.Show("Cannot install this program with Administrator privileges. Try again as a normal user.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End If
    End Sub

    Private Sub SystemAdministration_SystemReadiness_Click(sender As Object, e As EventArgs) Handles SystemAdministration_SystemReadiness.Click
        Dim Message = "System Readiness is not made for everyone as it breaks functionalities which are useful to people. Are you sure you want to continue?"
        Dim Caption = "Warning"
        Dim ButtonLayout = MessageBoxButtons.YesNo
        Dim Icon = MessageBoxIcon.Warning
        Dim Result As DialogResult
        Result = MessageBox.Show(Message, Caption, ButtonLayout, Icon)
        If Result = DialogResult.Yes Then
            If GetCurrentRole.IsUserAdmin() = True Then
                Process.Start("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/gfelipe099/sunvalley-srw/sunvalley-v2/modules/ApplySystemReadiness.ps1'))")
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
                Process.Start("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/gfelipe099/sunvalley-srw/sunvalley-v2/modules/ApplySystemReadinessLite.ps1'))")
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
                Process.Start("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/gfelipe099/sunvalley-srw/sunvalley-v2/modules/RemoveAllUwpApps.ps1'))")
            Else
                MessageBox.Show("You need Administrator privileges to do this.", "Access denied", MessageBoxButtons.OK, MessageBoxIcon.Error)
            End If
        End If
    End Sub

    Private Sub SystemAdministration_RemoveAllNonCriticalUwpApps_Click(sender As Object, e As EventArgs) Handles SystemAdministration_RemoveAllNonCriticalUwpApps.Click
        If GetCurrentRole.IsUserAdmin() = True Then
            Process.Start("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/gfelipe099/sunvalley-srw/sunvalley-v2/modules/RemoveAllNonCriticalUwpApps.ps1'))")
        Else
            MessageBox.Show("You need Administrator privileges to do this.", "Access denied", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End If
    End Sub

    Private Sub SystemAdministration_ReinstallAllUwpApps_Click(sender As Object, e As EventArgs) Handles SystemAdministration_ReinstallAllUwpApps.Click
        If GetCurrentRole.IsUserAdmin() = True Then
            Process.Start("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/gfelipe099/sunvalley-srw/sunvalley-v2/modules/ReinstallAllUwpApps.ps1'))")
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
