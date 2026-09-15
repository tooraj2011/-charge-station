# Firmware

Firmware is separated by execution domain and safety responsibility.

- `charger-brain/` — STM32H7 application/control firmware
- `safety-controller/` — STM32G0 safety and supervisory functions
- `bootloader/` — secure boot and update mechanisms
- `drivers/` — hardware abstraction and peripheral drivers
- `protocol-stack/` — CAN and charger communication layers
- `diagnostics/` — fault codes, logs and service diagnostics
- `tests/` — unit, integration and HIL tests

Firmware releases must identify hardware revision, compiler/toolchain, configuration and verification evidence.