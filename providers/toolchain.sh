#!/usr/bin/env bash
set -euo pipefail

# arm tool chain
wget -q -O gcc-arm-none-eabi.tar.bz2 \
  https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2
tar xjf gcc-arm-none-eabi.tar.bz2 && mv gcc-arm-none-eabi-* gcc-arm-none-eabi
rm -vf gcc-arm-none-eabi.tar.bz2
# esp tool chain
git clone -q --recursive https://github.com/pfalcon/esp-open-sdk.git
cd esp-open-sdk
# patch check for bash version
sed -i -e 's/version [(][^)]*[)]/version (3\.[1-9]|4|5)/' crosstool-NG/configure.ac
# build
make 1&> /dev/null

# shellcheck disable=SC2016
echo 'export PATH="${PATH}:/home/vagrant/gcc-arm-none-eabi/bin"' >> .bash_profile
# shellcheck disable=SC2016
echo 'export PATH="${PATH}:/home/vagrant/esp-open-sdk/xtensa-lx106-elf/bin"' >> .bash_profile
