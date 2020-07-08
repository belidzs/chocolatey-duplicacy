
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/gilbertchen/duplicacy/releases/download/v2.6.1/duplicacy_win_i386_2.6.1.exe'
$url64      = 'https://github.com/gilbertchen/duplicacy/releases/download/v2.6.1/duplicacy_win_x64_2.6.1.exe'
$checksum      = '462be4d1671a0b5b51b1471de163399debddaebd82147c7ca28e9aa2f293389e'
$checksumType  = 'sha256'
$checksum64    = '2570a892e65c503b506f2b5cd0ab8475b998b4f43b308e0a9484942505acf506'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $toolsDir\'duplicacy.exe' -Url $url -Url64bit $url64 -Checksum $checksum -ChecksumType $checksumType -Checksum64 $checksum64 -ChecksumType64 $checksumType64
