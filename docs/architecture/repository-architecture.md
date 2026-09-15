# Repository Architecture

## 1. Purpose

This repository follows a systems-engineering structure for an EV charging platform. Hardware, firmware, software, protocols, verification, certification and manufacturing evidence are separated so that every implementation can be traced to an engineering requirement.

## 2. Lifecycle

Requirements → System Architecture → Electrical/Mechanical Design → Firmware/Software → Integration → Verification → Validation → Certification → Manufacturing → Field Monitoring

## 3. Top-Level Domains

- `docs/` — controlled engineering documentation and decision records
- `hardware/` — schematics, PCB, BOM, mechanical and thermal design
- `firmware/` — MCU firmware, bootloader, drivers and safety software
- `software/` — backend, APIs, web/mobile applications and tools
- `protocols/` — OCPP, OCPI, ISO 15118, CAN and internal interfaces
- `tests/` — automated, HIL, electrical, functional and system tests
- `simulation/` — LTspice, digital-twin and system simulation assets
- `ai/` — datasets, feature definitions, models and edge inference
- `manufacturing/` — DFM, assembly, programming, calibration and production tests
- `certification/` — compliance matrix, reports, declarations and certification evidence
- `field/` — deployment, telemetry, incidents and service evidence
- `.github/` — CI/CD, issue templates, PR templates and repository automation

## 4. Traceability

Every safety-critical or externally visible feature should be traceable through:

Requirement → Design Item → Implementation → Test Case → Test Result → Evidence → Release

## 5. IP and Confidentiality

Supplier NDA material, customer information, credentials, private certificates and unreleased patent/business strategy documents must not be committed to this public repository.
