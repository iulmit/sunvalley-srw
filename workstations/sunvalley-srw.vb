Imports System.Security.Principal
Imports System.IO
Imports System.IO.Compression
Imports System.Net

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

    Private Sub Programs_Install_7zip_Click(sender As Object, e As EventArgs) Handles Programs_Install_7zip.Click
        Process.Start("powershell.exe", "winget install 7zip.7zip")
    End Sub

    Private Sub Programs_Install_Steam_Click(sender As Object, e As EventArgs) Handles Programs_Install_Steam.Click
        Process.Start("powershell.exe", "winget install Valve.Steam")
    End Sub

    Private Sub Programs_Install_Egl_Click(sender As Object, e As EventArgs) Handles Programs_Install_Egl.Click
        Process.Start("powershell.exe", "winget install EpicGames.EpicGamesLauncher")
    End Sub

    Private Sub Programs_Install_EADesktop_Click(sender As Object, e As EventArgs) Handles Programs_Install_Ead.Click
        Process.Start("powershell.exe", "winget install ElectronicArts.EADesktop")
    End Sub

    Private Sub Programs_Install_Discord_Click(sender As Object, e As EventArgs) Handles Programs_Install_Discord.Click
        Process.Start("powershell.exe", "winget install Discord.Discord")
    End Sub

    Private Sub Programs_Install_Sdi_Click(sender As Object, e As EventArgs) Handles Programs_Install_Sdi.Click
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

    Private Sub Programs_Install_KDE_Connect_Click(sender As Object, e As EventArgs) Handles Programs_Install_Kdec.Click
        Process.Start("powershell.exe", "winget install KDE.KDEConnect")
    End Sub

    Private Sub Programs_Install_Android_Studio_Click(sender As Object, e As EventArgs) Handles Programs_Install_As.Click
        Process.Start("powershell.exe", "winget install Google.AndroidStudio")
    End Sub

    Private Sub Programs_Install_Brave_Click(sender As Object, e As EventArgs) Handles Programs_Install_Brave.Click
        Process.Start("powershell.exe", "winget install BraveSoftware.BraveBrowser")
    End Sub

    Private Sub Programs_Install_Microsoft_Teams_Click(sender As Object, e As EventArgs) Handles Programs_Install_Mt.Click
        Process.Start("powershell.exe", "winget install Microsoft.Teams")
    End Sub

    Private Sub Programs_Install_Td_Click(sender As Object, e As EventArgs) Handles Programs_Install_Td.Click
        Process.Start("powershell.exe", "winget install Telegram.TelegramDesktop")
    End Sub

    Private Sub Programs_Install_Vscm_Click(sender As Object, e As EventArgs) Handles Programs_Install_Vscm.Click
        Process.Start("powershell.exe", "winget install VSCodium.VSCodium")
    End Sub

    Private Sub Programs_Install_Vsc_Click(sender As Object, e As EventArgs) Handles Programs_Install_Vscm.Click
        Process.Start("powershell.exe", "winget install Microsoft.VisualStudioCode")
    End Sub

    Private Sub Programs_Install_Gd_Click(sender As Object, e As EventArgs) Handles Programs_Install_Gd.Click
        Process.Start("powershell.exe", "winget install GitHub.GitHubDesktop")
    End Sub

    Private Sub SystemAdministration_SystemReadiness_Click(sender As Object, e As EventArgs) Handles SystemAdministration_SystemReadiness.Click
        If GetCurrentRole.IsUserAdmin() = True Then
            Process.Start("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/gfelipe099/sunvalley-sr-modules/main/workstations/SystemReadiness.ps1'))")
        Else
            MessageBox.Show("You need Administrator privileges to do this.", "Access denied", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End If
    End Sub
    Private Sub SystemAdministration_RemoveAllUwpApps_Click(sender As Object, e As EventArgs) Handles SystemAdministration_RemoveAllUwpApps.Click
        If GetCurrentRole.IsUserAdmin() = True Then
            Process.Start("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/gfelipe099/sunvalley-sr-modules/main/workstations/RemoveAllUwpApps.ps1'))")
        Else
            MessageBox.Show("You need Administrator privileges to do this.", "Access denied", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End If
    End Sub

    Private Sub SystemAdministration_RemoveNonCriticalUwpApps_Click(sender As Object, e As EventArgs) Handles SystemAdministration_RemoveNonCriticalUwpApps.Click
        If GetCurrentRole.IsUserAdmin() = True Then
            Process.Start("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/gfelipe099/sunvalley-sr-modules/main/workstations/RemoveNonCriticalUwpApps.ps1'))")
        Else
            MessageBox.Show("You need Administrator privileges to do this.", "Access denied", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End If
    End Sub

    Private Sub SystemAdministration_ReinstallAllUwpApps_Click(sender As Object, e As EventArgs) Handles SystemAdministration_ReinstallAllUwpApps.Click
        MessageBox.Show("This is not implemented yet.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
    End Sub


    Private Sub ThirdParty_CttWin10script_Click(sender As Object, e As EventArgs) Handles Thirdparty_Cttwin10script.Click
        If GetCurrentRole.IsUserAdmin() = True Then
            Process.Start("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/JJ8R4'))")
        Else
            MessageBox.Show("You need Administrator privileges to execute this script.", "Access denied", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End If
    End Sub


End Class
