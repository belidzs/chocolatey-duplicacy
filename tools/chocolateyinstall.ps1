
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/gilbertchen/duplicacy/releases/download/v3.1.0/duplicacy_win_i386_3.1.0.exe'
$url64      = 'https://github.com/gilbertchen/duplicacy/releases/download/v3.1.0/duplicacy_win_x64_3.1.0.exe'
$checksum      = 'fcaf2c9f5dd32fbbeb449b877e01019dcec319963640ae31eab973654650c278'
$checksumType  = 'sha256'
$checksum64    = '196aa7f2f3ef70a83ec659142c6fcce69301e1bdb415faf804a67183a638e828'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $toolsDir\'duplicacy.exe' -Url $url -Url64bit $url64 -Checksum $checksum -ChecksumType $checksumType -Checksum64 $checksum64 -ChecksumType64 $checksumType64
