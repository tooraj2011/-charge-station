# EV Charger Software

## Upstream architecture

The EV-charger edge layer follows the EVerest model: modular services, EVSE orchestration, hardware drivers, protocol implementations, authentication, energy management and simulation.

Upstream source is materialized at `third-party/everest/` by `scripts/bootstrap-third-party.ps1`.

## IFA-owned layer

IFA-specific modules belong here or in dedicated integration modules, not by editing upstream code without an explicit upstream overlay record.

Recommended future structure:

```text
software/ev-charger/
├── ifa-modules/
├── configurations/
├── deployments/
├── integration-tests/
└── README.md
```
