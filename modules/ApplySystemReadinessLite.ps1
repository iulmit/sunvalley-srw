#
# Created by Ken Hoo (mrkenhoo)
# ApplySystemReadiness module for sunvalley-srw
#

Import-Module BitsTransfer 2>&1
Write-Host "==> Downloading O&O ShutUp10..."
cd $env:TEMP
Start-BitsTransfer -Source "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe" -Destination OOSU10.exe 2>&1
    
Write-Host "    --> Downloading mrkenhoo's O&O ShutUp10 recommended configuration file..."
Start-BitsTransfer -Source "https://raw.githubusercontent.com/mrkenhoo/sunvalley-srw/sunvalley-v3/telemetry_policies/recommended/ooshutup10.cfg" -Destination ooshutup10.cfg 2>&1

Write-Host "    --> Applying policies from O&O ShutUp10 configuration file..."
.\OOSU10.exe ooshutup10.cfg /quiet
cd $PSScriptRoot
Remove-Module BitsTransfer
