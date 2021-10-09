#
# Created by Ken Hoo (mrkenhoo)
# DisableAllWindowsOptionalFeatures.ps1 module for sunvalley-srw
#

$wof = (Get-WindowsOptionalFeature -FeatureName '*' -Online).FeatureName
Write-Host ('==> Found ' + $wof.Count + ' Windows optional feature(s) on this system')
$wof | ForEach-Object {
    Write-Host "    -> Disable optional feature: $_..."
    Disable-WindowsOptionalFeature -FeatureName $_ -Online -NoRestart -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
}
