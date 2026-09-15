# Upstream Platforms

This repository vendors the upstream source trees as ordinary files so the IFA engineering team and AI coding agents can inspect and modify the source directly.

## Imported platforms

| Platform | Upstream repository | Branch | Local path |
|---|---|---|---|
| EVerest | `https://github.com/EVerest/EVerest.git` | `main` | `platforms/everest/` |
| OpenEVSE Core | `https://github.com/OpenEVSE/open_evse.git` | `master` | `platforms/openevse/open_evse/` |
| OpenEVSE ESP32 Firmware | `https://github.com/OpenEVSE/openevse_esp32_firmware.git` | `master` | `platforms/openevse/openevse_esp32_firmware/` |
| EVtivity CSMS | `https://github.com/EVtivity/evtivity-csms.git` | `main` | `platforms/evtivity/evtivity-csms/` |

## Import model

The projects are **vendored**, not Git submodules. Their `.git` directories are removed after cloning, so the source files become normal files in this repository and can be changed directly.

Each imported tree receives an `UPSTREAM-PROVENANCE.txt` file containing the source URL, branch, and exact imported commit SHA.

## Important

Before distributing a modified build or combining code into a commercial product, review and preserve the license and notice requirements of every upstream component. Do not remove upstream copyright or license files.

## Re-import

Run:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\import-upstreams.ps1
```

To import everything except EVtivity:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\import-upstreams.ps1 -SkipEVtivity
```
