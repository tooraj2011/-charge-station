# Third-party platforms

This directory defines upstream platforms used by the IFA charging-station platform.

The source repositories are intentionally kept as upstream dependencies rather than copied into IFA-owned source trees. Run the bootstrap script to materialize them locally.

## Upstream components

- EVerest: `third-party/everest/`
- OpenEVSE ESP32 gateway: `third-party/openevse-esp32/`
- OpenEVSE controller reference: `third-party/openevse-controller/`
- EVtivity CSMS: `third-party/evtivity-csms/`
- EVtivity Kubernetes deployment: `third-party/evtivity-csms-helm/`
- EVtivity mobile app: `third-party/evtivity-mobile-app/`

See `third-party/manifest.yaml` for repository URLs and integration roles.
