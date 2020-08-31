
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/gilbertchen/duplicacy/releases/download/v2.6.2/duplicacy_win_i386_2.6.2.exe'
$url64      = 'https://github.com/gilbertchen/duplicacy/releases/download/v2.6.2/duplicacy_win_x64_2.6.2.exe'
$checksum      = 'de4f49caa2eb6fb5d6758f979fbc8e3709719630fe681a9e4de059f5188a2062'
$checksumType  = 'sha256'
$checksum64    = '80efd59a9d1b7df12ba9a6ed2070b1c133303796f45854e2bfb97896e32e530e'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $toolsDir\'duplicacy.exe' -Url $url -Url64bit $url64 -Checksum $checksum -ChecksumType $checksumType -Checksum64 $checksum64 -ChecksumType64 $checksumType64
