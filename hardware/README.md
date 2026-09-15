# Hardware

## Structure

- `schematics/` — KiCad schematics
- `pcb/` — PCB projects and manufacturing outputs
- `bom/` — controlled BOMs
- `mechanical/` — enclosure, mounting and CAD references
- `thermal/` — thermal calculations and validation
- `power-stage/` — power modules, protection and DC bus
- `control/` — charger brain, safety MCU and interfaces
- `metrology/` — voltage/current/temperature sensing

Binary production outputs should be released and versioned deliberately; do not commit generated clutter.