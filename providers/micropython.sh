#!/usr/bin/env bash
set -euo pipefail

git clone -q --recursive --depth 1 --jobs 2 --branch "$VERSION" https://github.com/micropython/micropython.git

cd micropython
git reset --hard .

# adapt sources to include custom modules
echo 'SDKCONFIG += boards/sdkconfig.ble' >> "ports/esp8266/boards/GENERIC/mpconfigboard.mk"
# shellcheck disable=SC2016
echo 'include("$(MPY_DIR)/../sources/manifest.py")' >> "ports/stm32/boards/manifest.py"
# shellcheck disable=SC2016
echo 'include("$(MPY_DIR)/../sources/manifest.py")' >> "ports/esp8266/boards/manifest.py"
