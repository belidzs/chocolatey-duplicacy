
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/gilbertchen/duplicacy/releases/download/v2.2.3/duplicacy_win_i386_2.2.3.exe'
$url64      = 'https://github.com/gilbertchen/duplicacy/releases/download/v2.2.3/duplicacy_win_x64_2.2.3.exe'
$checksum      = 'f96f72a1c656c17160e971decbc2d94e292331f7c3e58cfe35136e8bb6929f8e'
$checksumType  = 'sha256'
$checksum64    = '69950e9a434b66c919e943822074f52165d15dc5fa33565fef162b6f60e30410'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $toolsDir\'duplicacy.exe' -Url $url -Url64bit $url64 -Checksum $checksum -ChecksumType $checksumType -Checksum64 $checksum64 -ChecksumType64 $checksumType64
