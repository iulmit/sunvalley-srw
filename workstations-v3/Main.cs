using System;
using System.Windows.Forms;

namespace workstations_v3
{
    public partial class Container : Form
    {
        public Container()
        {
            InitializeComponent();
        }

        private void Container_Load(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
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
            if (DependenciesManager.IsWingetInstalled() == true)
            {
                ProcessManager.NewProcess("powershell.exe", "winget source update");
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
            if (DependenciesManager.IsWingetInstalled() == true)
            {
                ProcessManager.NewProcess("powershell.exe", "winget upgrade --all");
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
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == false)
                {
                    ProcessManager.NewProcess("powershell.exe", "Start-Process 'ms-appinstaller:?source=https://aka.ms/getwinget'");
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
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e 7zip.7zip");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_Steam_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e Valve.Steam");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_EpicGamesLauncher_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e EpicGames.EpicGamesLauncher");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_EADesktop_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e ElectronicArts.EADesktop");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_Discord_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e Discord.Discord");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_Gimp_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e GIMP.GIMP");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_KdeConnect_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled()  == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e KDE.KDEConnect");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }
        private void Install_AndroidStudio_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e Google.AndroidStudio");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_Brave_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e BraveSoftware.BraveSoftware");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_MicrosoftTeams_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e Microsoft.MicrosoftTeams");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_TelegramDesktop_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e Telegram.TelegramDesktop");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_VisualStudioCodium_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e VSCodium.VSCodium");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_VisualStudioCode_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e Microsoft.VisualStudioCode");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_GitHubDesktop_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e GitHub.GitHubDesktop");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_Skype_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e Microsoft.Skype");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_WindowsTerminal_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e Microsoft.WindowsTerminal");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_BleachBit_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e BleachBit.BleachBit");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_Xampp_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e ApacheFriends.Xampp");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_Spotify_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == true)
            {
                var Message = "You cannot install this program with administrator privileges.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e Spotify.Spotify");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_Transmission_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e Transmission.Transmission");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_GoogleDrive_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e Transmission.Transmission");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_OneDrive_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e Microsoft.OneDrive");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_CrystalDiskInfo_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e CrystalDewWorld.CrystalDiskInfo");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_InnoSetup_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e JRSoftware.InnoSetup");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_Bitwarden_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e Bitwarden.Bitwarden");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_VisualStudioCommunity_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e Microsoft.VisualStudio.2022.Community");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_VisualStudioEnterprise_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e Microsoft.VisualStudio.2022.Enterprise");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_GeForceNow_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e NVIDIA.GeForceNow");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_GeForceExperience_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e NVIDIA.GeForceExperience");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_AmdRyzenMaster_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e AMD.RyzenMaster");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_Mremoteng_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e mRemoteNG.mRemoteNG");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_PlayStationNow_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e PlatStation.PSNow");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_LightShot_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                ProcessManager.NewProcess("powershell.exe", "Write-Host Downloading LightShot...; Invoke-WebRequest -Uri https://app.prntscr.com/build/setup-lightshot.exe -OutFile $env:TEMP/setup-lightshot.exe -UseBasicParsing; cd $env:TEMP; Write-Host Installing LightShot...; setup-lightshot.exe /SILENT /NORESTART; cd $PSScriptRoot");
            }
        }

        private void Install_Flameshot_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e Flameshot.Flameshot");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }


        private void Install_Vim_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e vim.vim");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void InstallGit_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e Git.Git");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }
        private void Install_Onlyoffice_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e ONLYOFFICE.DesktopEditors");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_Libreoffice_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e TheDocumentFoundation.LibreOffice");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_Element_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e Element.Element");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Install_Jami_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to install this program.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    ProcessManager.NewProcess("powershell.exe", "winget install -e SFLinux.Jami");
                }
                else
                {
                    var Message = "Cannot install this program because winget is not installed.";
                    var Caption = "Cannot find winget";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void Apply_SystemReadiness_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to execute this script.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                ProcessManager.NewProcess("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/mrkenhoo/sunvalley-srw/sunvalley-v3/modules/ApplySystemReadiness.ps1'))");
            }
        }

        private void Apply_SystemReadinessLite_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to execute this script.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                ProcessManager.NewProcess("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/mrkenhoo/sunvalley-srw/sunvalley-v3/modules/ApplySystemReadinessLite.ps1'))");
            }
        }

        private void RemoveAllUwpApps_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to execute this script.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                ProcessManager.NewProcess("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/mrkenhoo/sunvalley-srw/sunvalley-v3/modules/RemoveAllUwpApps.ps1'))");
            }
        }

        private void RemoveNonCriticalUwpApps_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to execute this script.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                ProcessManager.NewProcess("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/mrkenhoo/sunvalley-srw/sunvalley-v3/modules/RemoveAllNonCriticalUwpApps.ps1'))");
            }
        }

        private void ReinstallAllUwpApps_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to execute this script.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                ProcessManager.NewProcess("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/mrkenhoo/sunvalley-srw/sunvalley-v3/modules/ReinstallUwpApps.ps1'))");
            }
        }

        private void DisableAllWindowsOptionalFeatures_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to execute this script.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                ProcessManager.NewProcess("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/mrkenhoo/sunvalley-srw/sunvalley-v3/modules/DisableAllWindowsOptionalFeatures.ps1'))");
            }
        }

        private void RemoveAllWindowsCapabilities_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to execute this script.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                ProcessManager.NewProcess("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/mrkenhoo/sunvalley-srw/sunvalley-v3/modules/RemoveAllWindowsCapabilities.ps1'))");
            }
        }

        private void AutoUpgradeWingetPackages_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges to do this task.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                if (DependenciesManager.IsWingetInstalled() == true)
                {
                    TaskManager.CreateTask("UpgradeWingetPackages", "winget.exe", "winget upgrade --all", null, "Automatically upgrades winget packages on a daily basis", 1);
                }
                else
                {
                    var Message = "To create this task you need to install winget.";
                    var Caption = "Cannot create task";
                    var ButtonLayout = MessageBoxButtons.OK;
                    var Icon = MessageBoxIcon.Warning;
                    MessageBox.Show(Message, Caption, ButtonLayout, Icon);
                }
            }
        }

        private void CttWin10script_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges toexecute this script.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                ProcessManager.NewProcess("powershell.exe", "iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/JJ8R4'))");
            }
        }

        private void SimeononSecurityWoh_Click(object sender, EventArgs e)
        {
            if (PrivilegesManager.IsUserAdmin() == false)
            {
                var Message = "You need administrator privileges toexecute this script.";
                var Caption = "Insufficient privileges";
                var ButtonLayout = MessageBoxButtons.OK;
                var Icon = MessageBoxIcon.Error;
                MessageBox.Show(Message, Caption, ButtonLayout, Icon);
            }
            else
            {
                ProcessManager.NewProcess("powershell.exe", "iwr -useb 'https://simeononsecurity.ch/scripts/windowsoptimizeanddebloat.ps1'|iex");
            }
        }

        private void VisitGithubRepository_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("https://github.com/mrkenhoo/sunvalley-srw");
        }
    }
}
