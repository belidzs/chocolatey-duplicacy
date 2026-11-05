[CmdletBinding()]
param(
    [switch]$Force
)

Set-Location $PSScriptRoot

if ($Force) { $global:au_Force = $true }

Import-Module Chocolatey-AU

function global:au_GetLatest {
    $headers = @{}
    if ($env:GITHUB_TOKEN) {
        $headers['Authorization'] = "Bearer $env:GITHUB_TOKEN"
    }

    $LatestRelease = Invoke-RestMethod -Headers $headers -Uri 'https://api.github.com/repos/gilbertchen/duplicacy/releases/latest'

    $Asset32 = $LatestRelease.assets | Where-Object { $_.name -like 'duplicacy_win_i386_*.exe' }
    $Asset64 = $LatestRelease.assets | Where-Object { $_.name -like 'duplicacy_win_x64_*.exe' }
    if (!$Asset32 -or !$Asset64) {
        throw "Windows executables (duplicacy_win_i386_*.exe, duplicacy_win_x64_*.exe) not found in release $($LatestRelease.tag_name)."
    }

    return @{
        Version = $LatestRelease.tag_name.TrimStart('v')
        URL32   = $Asset32.browser_download_url
        URL64   = $Asset64.browser_download_url
    }
}

function global:au_BeforeUpdate {
    # AU computes checksums by running the install script, which downloads the
    # executable into tools\. Remove it so that it doesn't get packed into the nupkg.
    Remove-Item 'tools\duplicacy.exe' -Force -ErrorAction SilentlyContinue
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*\`$url\s*=\s*)('.*')"            = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*\`$url64\s*=\s*)('.*')"          = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*\`$checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*\`$checksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType32)'"
            "(?i)(^\s*\`$checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*\`$checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
        }
    }
}

$package = Update-Package -ChecksumFor all
if ($package -and $package.Updated) {
    $package.NuspecVersion = $package.RemoteVersion
}
return $package
