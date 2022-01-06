using Microsoft.Win32.TaskScheduler;
using System;

namespace workstations_v3
{
    public class TaskManager
    {
        public static void CreateTask(string TaskName, string ExecutableFile, string Arguments, string WorkingDirectory, string description, short NumberOfDays) {
            TaskService ts = new();
            TaskDefinition td = ts.NewTask();
            
            td.RegistrationInfo.Description = description;

            td.Triggers.Add(new DailyTrigger
            {
                DaysInterval = NumberOfDays
            });

            td.Actions.Add(new ExecAction(ExecutableFile, Arguments, WorkingDirectory));

            ts.RootFolder.RegisterTaskDefinition(TaskName, td);
        }
        public static void RemoveTask(string TaskName)
        {
            TaskService ts = new();

            ts.RootFolder.DeleteTask(TaskName);
        }
    }
}
