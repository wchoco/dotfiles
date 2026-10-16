# setup for Windows: load config/powershell/profile.ps1 from $PROFILE
param(
    [string]$ProfilePath = $PROFILE.CurrentUserAllHosts
)
$ErrorActionPreference = 'Stop'

$source = Join-Path $PSScriptRoot 'config\powershell\profile.ps1'
$line = ". `"$source`""

$profileDir = Split-Path -Parent $ProfilePath
if (-not (Test-Path $profileDir)) {
    New-Item -ItemType Directory -Path $profileDir | Out-Null
}
if ((Test-Path $ProfilePath) -and (Select-String -Path $ProfilePath -SimpleMatch $line -Quiet)) {
    Write-Host "already loaded: $ProfilePath"
} else {
    Add-Content -Path $ProfilePath -Value $line
    Write-Host "add: $line -> $ProfilePath"
}

if (-not (Get-Command zellij.exe -ErrorAction SilentlyContinue)) {
    Write-Host 'zellij is not installed: winget install --id Zellij.Zellij -e'
}
