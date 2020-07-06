
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/gilbertchen/duplicacy/releases/download/v2.6.0/duplicacy_win_i386_2.6.0.exe'
$url64      = 'https://github.com/gilbertchen/duplicacy/releases/download/v2.6.0/duplicacy_win_x64_2.6.0.exe'
$checksum      = '561f346a7bd7e83e31f54f6317c75766c76007f9882c7edb61ce1fe1c8348ec1'
$checksumType  = 'sha256'
$checksum64    = 'd5a00f6615f96878a5a95a891538f5a02c77f42a042c733132b1d681702fc335'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $toolsDir\'duplicacy.exe' -Url $url -Url64bit $url64 -Checksum $checksum -ChecksumType $checksumType -Checksum64 $checksum64 -ChecksumType64 $checksumType64
