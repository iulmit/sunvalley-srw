#
# Created by Ken Hoo (mrkenhoo)
# DisableAllWindowsOptionalFeatures.ps1 module for sunvalley-srw
#

$wof = (Get-WindowsOptionalFeature -FeatureName '*' -Online).FeatureName
Write-Host ('==> Found ' + $wof.Count + ' Windows optional feature(s) on this system')
$wof | ForEach-Object {
    Write-Host "    -> Disabling optional feature: $_..."
    Disable-WindowsOptionalFeature -FeatureName $_ -Online -NoRestart -ErrorAction SilentlyContinue -WarningAction SilentlyContinue | Out-Null
}

Write-Host -NoNewLine 'Press any key to continue...';
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');