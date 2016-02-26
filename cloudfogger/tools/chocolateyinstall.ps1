
$ErrorActionPreference = 'Stop';
$packageName= 'cloudfogger'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.cloudfogger.com/download/Cloudfogger_Setup.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  softwareName  = 'cloudfogger*'
}

Get-Process | Where-Object { $_.name -eq "cloudfogger" } | Foreach-Object { $_.Kill() }
Install-ChocolateyPackage @packageArgs


















