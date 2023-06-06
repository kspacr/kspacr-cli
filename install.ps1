#!/usr/bin/env pwsh
# Copyright 2018 the Deno authors. All rights reserved. MIT license.
# TODO(everyone): Keep this script simple and easily auditable.

$ErrorActionPreference = 'Stop'

$Version = if ($v) {
    $v
} elseif ($args.Length -eq 1) {
    $args.Get(0)
} else {
    "latest"
}

$kspacrInstall = $env:KSPACR_INSTALL_DIR
$BinDir = if ($kspacrInstall) {
    "$kspacrInstall\bin"
} else {
    "$Home\.kspacr\bin"
}

$kspacrZip = "$BinDir\kspacr.zip"
$kspacrExe = "$BinDir\kspacr.exe"
$Target = 'windows_x86_64'

$DownloadUrl = if (!$Version) {
    "https://github.com/kspacr/kspacr-cli/releases/latest/download/kspacr-cli_${Target}.zip"
} else {
    "https://github.com/kspacr/kspacr-cli/releases/download/${Version}/kspacr-cli_-${Target}.zip"
}

if (!(Test-Path $BinDir)) {
    New-Item $BinDir -ItemType Directory | Out-Null
}

curl.exe -Lo $kspacrZip $DownloadUrl
tar.exe xf $kspacrZip -C $BinDir
Remove-Item $kspacrZip

$User = [EnvironmentVariableTarget]::User
$Path = [Environment]::GetEnvironmentVariable('Path', $User)
if (!(";$Path;".ToLower() -like "*;$BinDir;*".ToLower())) {
    [Environment]::SetEnvironmentVariable('Path', "$Path;$BinDir", $User)
    $Env:Path += ";$BinDir"
}

Write-Output "kspacr CLI was installed successfully to $kspacrctlExe"
Write-Output "Run 'kspacr help' to get started"
