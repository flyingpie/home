
$ErrorActionPreference = "Stop"

Write-Host "Pulling submodules" -f cyan
git submodule update --init

Write-Host "Linking settings files" -f cyan
./scripts/link.ps1

Write-Host "Done!" -f green
