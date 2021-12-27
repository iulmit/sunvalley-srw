using System;
using System.Diagnostics;

namespace workstations_v3
{
    internal class ProcessManager
    {
        public static void NewProcess(string fileName, string args)
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
}
