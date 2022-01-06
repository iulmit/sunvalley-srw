using System.Reflection;

namespace workstations_v3
{
    partial class VersionManager
    {
        public static string ShowCurrentVersion()
        {
            return "Current version: " + typeof(Program).Assembly.GetName().Version.ToString();
        }
    }
}
