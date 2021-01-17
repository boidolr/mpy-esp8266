#!/usr/bin/env bash
set -euo pipefail

export MAKEOPTS="-j5"

cd micropython
make "${MAKEOPTS}" -C mpy-cross clean 1&> /dev/null
make "${MAKEOPTS}" -C mpy-cross 1&> /dev/null
# pybd board
make "${MAKEOPTS}" -C ports/stm32 clean submodules 1&> /dev/null
make "${MAKEOPTS}" -C ports/stm32 BOARD=PYBD_SF2 1&> /dev/null

export SOURCE="ports/stm32/build-PYBD_SF2"
export TARGET="../sources/build-PYBD_SF2"
mkdir -p "$TARGET"
cp "$SOURCE/firmware.elf" "$TARGET"
cp "$SOURCE/firmware.hex" "$TARGET"
cp "$SOURCE/firmware.dfu" "$TARGET"
echo "Copyied generated firmware to '$TARGET'"

# esp8266 board
make "${MAKEOPTS}" -C ports/esp8266 clean submodules 1&> /dev/null
make "${MAKEOPTS}" -C ports/esp8266 BOARD=GENERIC 1&> /dev/null

export SOURCE="ports/esp8266/build-GENERIC"
export TARGET="../sources/build-esp8266"
mkdir -p "$TARGET"
cp "$SOURCE/firmware.elf" "$TARGET"
cp "$SOURCE/firmware-combined.bin" "$TARGET"
echo "Copyied generated firmware to '$TARGET'"
