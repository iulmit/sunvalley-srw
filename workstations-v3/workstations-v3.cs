using System;
using System.Diagnostics;
using System.Security.Principal;
using System.Windows.Forms;

namespace workstations_v3
{
    public partial class Container : Form
    {
        partial class GetCurrentRole
        {
            public static bool IsUserAdmin()
            {
                WindowsIdentity identity = WindowsIdentity.GetCurrent();
                WindowsPrincipal principal = new WindowsPrincipal(identity);
                return principal.IsInRole(WindowsBuiltInRole.Administrator);
            }
        }

        partial class DependenciesChecker
        {
            public static bool IsWingetInstalled()
            {
                string LocalWindowsAppsDir = Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData) + "\\Microsoft\\WindowsApps\\";
                bool ExecutableExists;
                if (System.IO.File.Exists(LocalWindowsAppsDir + "winget.exe"))
                {
                    ExecutableExists = true;
                }
                else
                {
                    ExecutableExists = false;
                }
                return ExecutableExists;
            }
        }

        protected partial class Worker
        {
            public static void StartProcess(string fileName, string args)
            {
                try
                {
                    Process process = new Process();
                    process.StartInfo.FileName = fileName;
                    process.StartInfo.Arguments = args;
                    process.StartInfo.WindowStyle = ProcessWindowStyle.Maximized;
                    process.Start();
                    process.WaitForExit();
                }
                catch (ApplicationException ex)
                {
                    throw ex;
                }
            }
        }

        public Container()
        {
            InitializeComponent();
        }

        private void Container_Load(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "This program will be running without administrator privileges. Not all functions will work.";
                var Caption = "Warning";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Warning;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
        }

        private void Update_WingetSources_Click(object sender, EventArgs e)
        {
            if (DependenciesChecker.IsWingetInstalled() == true)
            {
                Worker.StartProcess("powershell.exe", "winget source update");
            }
            else
            {
                var Message = "Cannot update winget sources because winget is not installed.";
                var Caption = "Can't find winget";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Warning;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
        }

        private void Upgrade_AllPackages_Click(object sender, EventArgs e)
        {
            if (DependenciesChecker.IsWingetInstalled() == true)
            {
                Worker.StartProcess("powershell.exe", "winget upgrade --all");
            }
            else
            {
                var Message = "Cannot upgrade packages because winget is not installed.";
                var Caption = "Can't find winget";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Warning;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
        }

        private void Install_Winget_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesChecker.IsWingetInstalled() == false)
                {
                    Worker.StartProcess("powershell.exe", "ms-appinstaller:?source=https://aka.ms/getwinget");
                }
                else
                {
                    var Message = "winget is already installed on this system.";
                    var Caption = "Already installed";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Information;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_7zip_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesChecker.IsWingetInstalled() == true)
                {
                    Worker.StartProcess("powershell.exe", "winget install -e 7zip.7zip");
                }
            }
        }

        private void Install_Steam_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesChecker.IsWingetInstalled() == true)
                {
                    Worker.StartProcess("powershell.exe", "winget install -e Valve.Steam");
                }
            }
        }

        private void Install_EpicGamesLauncher_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesChecker.IsWingetInstalled() == true)
                {
                    Worker.StartProcess("powershell.exe", "winget install -e EpicGames.EpicGamesLauncher");
                }
            }
        }

        private void Install_EADesktop_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesChecker.IsWingetInstalled() == true)
                {
                    Worker.StartProcess("powershell.exe", "winget install -e ElectronicArts.EADesktop");
                }
            }
        }

        private void Install_Discord_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesChecker.IsWingetInstalled() == true)
                {
                    Worker.StartProcess("powershell.exe", "winget install -e Discord.Discord");
                }
            }
        }

        private void Install_Gimp_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesChecker.IsWingetInstalled() == true)
                {
                    Worker.StartProcess("powershell.exe", "winget install -e GIMP.GIMP");
                }
            }
        }

        private void Install_KdeConnect_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e KDE.KDEConnect");
            }
        }
        private void Install_AndroidStudio_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e Google.AndroidStudio");
            }
        }

        private void Install_Brave_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e BraveSoftware.BraveSoftware");
            }
        }

        private void Install_MicrosoftTeams_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e Microsoft.MicrosoftTeams");
            }
        }

        private void Install_TelegramDesktop_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e Telegram.TelegramDesktop");
            }
        }

        private void Install_VisualStudioCodium_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e VSCodium.VSCodium");
            }
        }

        private void Install_VisualStudioCode_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e Microsoft.VisualStudioCode");
            }
        }

        private void Install_GitHubDesktop_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e GitHub.GitHubDesktop");
            }
        }

        private void Install_Skype_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e Microsoft.Skype");
            }
        }

        private void Install_WindowsTerminal_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e Microsoft.WindowsTerminal");
            }
        }

        private void Install_BleachBit_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e BleachBit.BleachBit");
            }
        }

        private void Install_Xampp_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e ApacheFriends.Xampp");
            }
        }

        private void Install_Spotify_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == true)
            {
                var Message = "You cannot install this program with administrator privileges.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e Spotify.Spotify");
            }
        }

        private void Install_Transmission_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e Transmission.Transmission");
            }
        }

        private void Install_GoogleDrive_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e Transmission.Transmission");
            }
        }

        private void Install_OneDrive_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e Microsoft.OneDrive");
            }
        }

        private void Install_CrystalDiskInfo_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e CrystalDewWorld.CrystalDiskInfo");
            }
        }

        private void Install_InnoSetup_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e JRSoftware.InnoSetup");
            }
        }

        private void Install_Bitwarden_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e Bitwarden.Bitwarden");
            }
        }

        private void Install_VisualStudioCommunity_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e Microsoft.VisualStudio.2022.Community");
            }
        }

        private void Install_VisualStudioEnterprise_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e Microsoft.VisualStudio.2022.Enterprise");
            }
        }

        private void Install_GeForceNow_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e NVIDIA.GeForceNow");
            }
        }

        private void Install_GeForceExperience_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e NVIDIA.GeForceExperience");
            }
        }

        private void Install_AmdRyzenMaster_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e AMD.RyzenMaster");
            }
        }

        private void Install_Mremoteng_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e mRemoteNG.mRemoteNG");
            }
        }

        private void Install_PlayStationNow_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e PlatStation.PSNow");
            }
        }

        private void Install_LightShot_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "Write-Host Downloading LightShot...; Invoke-WebRequest -Uri https://app.prntscr.com/build/setup-lightshot.exe -OutFile $env:TEMP/setup-lightshot.exe -UseBasicParsing; cd $env:TEMP; Write-Host Installing LightShot...; setup-lightshot.exe /SILENT /NORESTART; cd $PSScriptRoot");
            }
        }

        private void Install_Flameshot_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e Flameshot.Flameshot");
            }
        }


        private void Install_Vim_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "winget install -e vim.vim");
            }
        }

        private void Apply_SystemReadiness_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/mrkenhoo/sunvalley-srw/sunvalley-v3/modules/ApplySystemReadiness.ps1'))");
            }
        }

        private void Apply_SystemReadinessLite_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/mrkenhoo/sunvalley-srw/sunvalley-v3/modules/ApplySystemReadinessLite.ps1'))");
            }
        }

        private void RemoveAllUwpApps_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/mrkenhoo/sunvalley-srw/sunvalley-v3/modules/RemoveAllUwpApps.ps1'))");
            }
        }

        private void RemoveNonCriticalUwpApps_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/mrkenhoo/sunvalley-srw/sunvalley-v3/modules/RemoveAllNonCriticalUwpApps.ps1'))");
            }
        }

        private void ReinstallAllUwpApps_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/mrkenhoo/sunvalley-srw/sunvalley-v3/modules/ReinstallUwpApps.ps1'))");
            }
        }

        private void DisableAllWindowsOptionalFeatures_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "iex ((New - Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/mrkenhoo/sunvalley-srw/sunvalley-v3/modules/DisableAllWindowsOptionalFeatures.ps1'))");
            }
        }

        private void CttWin10script_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/JJ8R4'))");
            }
        }

        private void SimeononSecurityWoh_Click(object sender, EventArgs e)
        {
            if (GetCurrentRole.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                Worker.StartProcess("powershell.exe", "iwr -useb 'https://simeononsecurity.ch/scripts/windowsoptimizeandharden.ps1'|iex");
            }
        }
    }
}
