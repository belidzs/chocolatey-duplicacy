
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/gilbertchen/duplicacy/releases/download/v2.7.2/duplicacy_win_i386_2.7.2.exe'
$url64      = 'https://github.com/gilbertchen/duplicacy/releases/download/v2.7.2/duplicacy_win_x64_2.7.2.exe'
$checksum      = '100c4a6be05bde5c562a194adbf89e2e0175e477153b8840febc60acad76e1a9'
$checksumType  = 'sha256'
$checksum64    = '6a270aa0e1ab44bc00f0114055f034cc569f84e0c91ebaf52384edc9e5243083'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $toolsDir\'duplicacy.exe' -Url $url -Url64bit $url64 -Checksum $checksum -ChecksumType $checksumType -Checksum64 $checksum64 -ChecksumType64 $checksumType64
