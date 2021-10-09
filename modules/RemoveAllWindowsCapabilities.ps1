#
# Created by Ken Hoo (mrkenhoo)
# DisableAllWindowsOptionalFeatures.ps1 module for sunvalley-srw
#

$wc = (Get-WindowsCapability -Online).Name
Write-Host ('==> Found ' + $wc.Count + ' Windows capabilities...')
$wc | ForEach-Object {
    Write-Host "    -> Removing capability: $_..."
    Remove-WindowsCapability -Name $_ -Online -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
}
