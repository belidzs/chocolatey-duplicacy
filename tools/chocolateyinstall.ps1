
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/gilbertchen/duplicacy/releases/download/v2.5.2/duplicacy_win_i386_2.5.2.exe'
$url64      = 'https://github.com/gilbertchen/duplicacy/releases/download/v2.5.2/duplicacy_win_x64_2.5.2.exe'
$checksum      = '0c052f369cae4186b7685ef2243468e18ae41358dd7bb8fb51067c9f79189145'
$checksumType  = 'sha256'
$checksum64    = '2113b093042a39a8570e4ad307d7e1e365b7fcc0be8bad4eec4333429d59d1c6'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $toolsDir\'duplicacy.exe' -Url $url -Url64bit $url64 -Checksum $checksum -ChecksumType $checksumType -Checksum64 $checksum64 -ChecksumType64 $checksumType64
