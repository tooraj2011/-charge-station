# CSMS

The CSMS layer follows the EVtivity monorepo boundaries where useful: API, OCPP, CSMS dashboard, driver portal, database, shared libraries, configuration, workers, OCPI and conformance tooling.

Upstream references are materialized under `third-party/evtivity-csms/`, `third-party/evtivity-csms-helm/` and `third-party/evtivity-mobile-app/`.

IFA-owned production code should live in this area only when it is intentionally developed as an IFA layer or fork, with the upstream commit and license recorded in `third-party/manifest.yaml`.

## Target boundary

```text
software/csms/
├── ifa-api/
├── ifa-operator/
├── ifa-driver-portal/
├── integrations/
├── deployment/
└── README.md
```
