[CmdletBinding()]
param(
    [switch]$SkipEVtivity
)

$ErrorActionPreference = 'Stop'
$RepoRoot = Resolve-Path (Join-Path $PSScriptRoot '..')
$Platforms = Join-Path $RepoRoot 'platforms'
$Tmp = Join-Path $RepoRoot '.upstream-tmp'

$Upstreams = @(
    @{ Name='everest'; Url='https://github.com/EVerest/EVerest.git'; Ref='main'; Destination=(Join-Path $Platforms 'everest') },
    @{ Name='openevse-core'; Url='https://github.com/OpenEVSE/open_evse.git'; Ref='master'; Destination=(Join-Path $Platforms 'openevse/open_evse') },
    @{ Name='openevse-esp32'; Url='https://github.com/OpenEVSE/openevse_esp32_firmware.git'; Ref='master'; Destination=(Join-Path $Platforms 'openevse/openevse_esp32_firmware') }
)

if (-not $SkipEVtivity) {
    $Upstreams += @{ Name='evtivity-csms'; Url='https://github.com/EVtivity/evtivity-csms.git'; Ref='main'; Destination=(Join-Path $Platforms 'evtivity/evtivity-csms') }
}

function Assert-Git {
    if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
        throw 'Git is not installed or is not available in PATH.'
    }
}

function Import-Upstream($Item) {
    $destination = [string]$Item.Destination
    if (Test-Path $destination) {
        throw "Destination already exists: $destination`nDelete it first if you want a clean import."
    }

    $parent = Split-Path $destination -Parent
    New-Item -ItemType Directory -Force -Path $parent | Out-Null
    New-Item -ItemType Directory -Force -Path $Tmp | Out-Null

    $clone = Join-Path $Tmp $Item.Name
    if (Test-Path $clone) { Remove-Item -Recurse -Force $clone }

    Write-Host "Cloning $($Item.Url) [$($Item.Ref)]..."
    git clone --branch $Item.Ref --single-branch $Item.Url $clone
    if ($LASTEXITCODE -ne 0) { throw "git clone failed for $($Item.Name)" }

    $sha = (git -C $clone rev-parse HEAD).Trim()
    if ([string]::IsNullOrWhiteSpace($sha)) { throw "Could not resolve commit SHA for $($Item.Name)" }

    Write-Host "Vendoring files into $destination ..."
    New-Item -ItemType Directory -Force -Path $destination | Out-Null
    Get-ChildItem -Force $clone | Where-Object { $_.Name -ne '.git' } | ForEach-Object {
        Copy-Item -Recurse -Force $_.FullName $destination
    }

    $provenance = @"
Upstream: $($Item.Url)
Ref: $($Item.Ref)
Imported commit: $sha
Imported at: $(Get-Date -Format o)
Method: vendored source copy; upstream .git metadata intentionally removed.
"@
    Set-Content -Path (Join-Path $destination 'UPSTREAM-PROVENANCE.txt') -Value $provenance -Encoding UTF8

    Remove-Item -Recurse -Force $clone
    Write-Host "Imported $($Item.Name) at $sha" -ForegroundColor Green
}

Assert-Git
New-Item -ItemType Directory -Force -Path $Platforms | Out-Null
New-Item -ItemType Directory -Force -Path $Tmp | Out-Null

foreach ($item in $Upstreams) { Import-Upstream $item }

Remove-Item -Recurse -Force $Tmp -ErrorAction SilentlyContinue

Write-Host ''
Write-Host 'IMPORT COMPLETE.' -ForegroundColor Green
Write-Host 'The upstream projects are now ordinary files inside this repository.'
Write-Host 'You can modify them directly with Claude Code, Cline, Copilot, Cursor, or another coding agent.'
Write-Host ''
Write-Host 'Next:'
Write-Host '  git status'
Write-Host '  git add platforms scripts docs'
Write-Host '  git commit -m "vendor: import EV charging upstream platforms"'
Write-Host '  git push origin main'
