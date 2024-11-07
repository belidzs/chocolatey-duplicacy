
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/gilbertchen/duplicacy/releases/download/v3.2.4/duplicacy_win_i386_3.2.4.exe'
$url64      = 'https://github.com/gilbertchen/duplicacy/releases/download/v3.2.4/duplicacy_win_x64_3.2.4.exe'
$checksum      = 'cb7c7a7cf8a23a751feea0bfb0b7fa1a076c750d5c643b867e5fad3d9908f7fe'
$checksumType  = 'sha256'
$checksum64    = '93893dcf86924426ecb3401d1983a839929aa482289992d8858b1ec60316f46b'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $toolsDir\'duplicacy.exe' -Url $url -Url64bit $url64 -Checksum $checksum -ChecksumType $checksumType -Checksum64 $checksum64 -ChecksumType64 $checksumType64
