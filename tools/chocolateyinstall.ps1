
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/gilbertchen/duplicacy/releases/download/v3.0.1/duplicacy_win_i386_3.0.1.exe'
$url64      = 'https://github.com/gilbertchen/duplicacy/releases/download/v3.0.1/duplicacy_win_x64_3.0.1.exe'
$checksum      = '34a84d2dfec437e953f5002cda3a593f8126f984c09641ff529ca516e456df9f'
$checksumType  = 'sha256'
$checksum64    = 'd3f83e1640367b666f57dee24f98c67f5d5de3beed4643138d30f4c0404e4e7e'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $toolsDir\'duplicacy.exe' -Url $url -Url64bit $url64 -Checksum $checksum -ChecksumType $checksumType -Checksum64 $checksum64 -ChecksumType64 $checksumType64
