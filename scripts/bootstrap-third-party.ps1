$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$thirdParty = Join-Path $root 'third-party'

$repos = @(
    @{ Name = 'everest'; Url = 'https://github.com/EVerest/everest.git'; Ref = 'main' },
    @{ Name = 'openevse-esp32'; Url = 'https://github.com/OpenEVSE/openevse_esp32_firmware.git'; Ref = 'master' },
    @{ Name = 'openevse-controller'; Url = 'https://github.com/OpenEVSE/open_evse.git'; Ref = 'master' },
    @{ Name = 'evtivity-csms'; Url = 'https://github.com/EVtivity/evtivity-csms.git'; Ref = 'main' },
    @{ Name = 'evtivity-csms-helm'; Url = 'https://github.com/EVtivity/evtivity-csms-helm.git'; Ref = 'main' },
    @{ Name = 'evtivity-mobile-app'; Url = 'https://github.com/EVtivity/evtivity-mobile-app.git'; Ref = 'main' }
)

New-Item -ItemType Directory -Force -Path $thirdParty | Out-Null

foreach ($repo in $repos) {
    $target = Join-Path $thirdParty $repo.Name
    if (Test-Path (Join-Path $target '.git')) {
        Write-Host "Updating $($repo.Name)..."
        git -C $target fetch --tags --prune
        git -C $target checkout $repo.Ref
        git -C $target pull --ff-only
    } elseif (Test-Path $target) {
        throw "Target exists but is not a Git repository: $target"
    } else {
        Write-Host "Cloning $($repo.Name)..."
        git clone --branch $repo.Ref --depth 1 $repo.Url $target
    }
}

Write-Host ''
Write-Host 'Third-party platforms are ready under third-party/.'
Write-Host 'Review licenses before production redistribution or SaaS deployment.'
