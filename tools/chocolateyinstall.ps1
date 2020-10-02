
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/gilbertchen/duplicacy/releases/download/v2.7.1/duplicacy_win_i386_2.7.1.exe'
$url64      = 'https://github.com/gilbertchen/duplicacy/releases/download/v2.7.1/duplicacy_win_x64_2.7.1.exe'
$checksum      = '948b629b1a3e0d2a44c9bec2476d346434fbf4168bb06f4b4af69367ad477880'
$checksumType  = 'sha256'
$checksum64    = '84e25be0599ea00cf9e4c114972b504d419d1ecf5b82887fe3a3c2c91d3ca935'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $toolsDir\'duplicacy.exe' -Url $url -Url64bit $url64 -Checksum $checksum -ChecksumType $checksumType -Checksum64 $checksum64 -ChecksumType64 $checksumType64
