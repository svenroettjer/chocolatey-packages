$packageName = 'cloudfogger'
$installerType = 'EXE'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'

$registryPath32 = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{E5A0D9A8-3711-4DB2-833C-FF79EF65830D}_is1'
$registryPathWow6432 = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{E5A0D9A8-3711-4DB2-833C-FF79EF65830D}_is1'

if (Test-Path $registryPath32) {
$registryPath = $registryPath32
}

if (Test-Path $registryPathWow6432) {
$registryPath = $registryPathWow6432
}

if ($registryPath) {
$uninstallString = (Get-ItemProperty -Path $registryPath -Name 'UninstallString').UninstallString
}

if ($uninstallString) {
stop-process -Name cloudfogger -force
Uninstall-ChocolateyPackage $packageName $installerType $silentArgs $uninstallString
}
