using System;

namespace workstations_v3
{
    partial class DependenciesManager
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
}
