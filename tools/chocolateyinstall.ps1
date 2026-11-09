
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/gilbertchen/duplicacy/releases/download/v3.3.0/duplicacy_win_i386_3.3.0.exe'
$url64      = 'https://github.com/gilbertchen/duplicacy/releases/download/v3.3.0/duplicacy_win_x64_3.3.0.exe'
$checksum      = 'dc736164a060243a3691c0604dc9b58ff6f8e9f59b3eaecc0659d27d772d4e3c'
$checksumType  = 'sha256'
$checksum64    = '702b6a49cc8ae599ed7215759c8599563ffdf4099d0728f8c6a1bff2ad63cb46'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $toolsDir\'duplicacy.exe' -Url $url -Url64bit $url64 -Checksum $checksum -ChecksumType $checksumType -Checksum64 $checksum64 -ChecksumType64 $checksumType64
