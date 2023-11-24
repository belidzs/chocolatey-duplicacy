
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/gilbertchen/duplicacy/releases/download/v3.2.3/duplicacy_win_i386_3.2.3.exe'
$url64      = 'https://github.com/gilbertchen/duplicacy/releases/download/v3.2.3/duplicacy_win_x64_3.2.3.exe'
$checksum      = 'b57150c84c95bc0ff176cafde36af7b08a60679526fb7a18aa3fd505b28a3819'
$checksumType  = 'sha256'
$checksum64    = '2c5e2fd0c9bc74e8538cbe81fc53f09447b68a95c2b4324ed43928deb99a25af'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $toolsDir\'duplicacy.exe' -Url $url -Url64bit $url64 -Checksum $checksum -ChecksumType $checksumType -Checksum64 $checksum64 -ChecksumType64 $checksumType64
