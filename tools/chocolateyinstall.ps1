
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/gilbertchen/duplicacy/releases/download/v2.7.0/duplicacy_win_i386_2.7.0.exe'
$url64      = 'https://github.com/gilbertchen/duplicacy/releases/download/v2.7.0/duplicacy_win_x64_2.7.0.exe'
$checksum      = '4c01298cb789dac5bc699a874b498930453d867f98eae40035dbae8cca1af411'
$checksumType  = 'sha256'
$checksum64    = '3d91a41a1df664ffbce36d23a2f37025966ccd4e247202c9e8805c7e71208640'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $toolsDir\'duplicacy.exe' -Url $url -Url64bit $url64 -Checksum $checksum -ChecksumType $checksumType -Checksum64 $checksum64 -ChecksumType64 $checksumType64
