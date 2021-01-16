# threshold-srw

## What is this?
System Readiness for Workstations is an automated privacy-focused configuration tool which debloats and tweaks Windows 10 Pro N for Workstations to improve it's performance and reduce the user's footprint.

## Modifications
* OS version validator before script's execution
* Script simplified
* Server tweaks removed
* Privacy settings hardened
* Security parameters hardened
* And maybe more in the future

## Getting started
Get started by opening PowerShell as administrator, then copy and right-click on the PowerShell window, this command:
> `powershell -nop -c "iex(New-Object Net.WebClient).DownloadString('https://git.io/JTlhC')"`

Or, if you prefer, allow the execution of untrusted scripts on PowerShell by using `Set-ExecutionPolicy unrestricted`. Afterwards, click [here](https://raw.githubusercontent.com/gfelipe099/threshold-srw/master/threshold-srw.ps1) to download the script and execute it yourself using `.\threshold-srw.ps1`.
