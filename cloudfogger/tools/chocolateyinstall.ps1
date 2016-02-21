
$ErrorActionPreference = 'Stop';


$packageName= 'cloudfogger'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.cloudfogger.com/download/Cloudfogger_Setup.exe'
$url64      = $url

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  softwareName  = 'cloudfogger*'
}

Install-ChocolateyPackage @packageArgs


















