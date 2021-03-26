#!/usr/bin/env bash
set -euo pipefail

# update image
apt-get -qq update && apt-get -qq upgrade -y && apt-get -qq autoremove -y
# generic build tools
apt-get -qq install -y build-essential python-dev python python-serial
# esp8266 build tools
apt-get -qq install -y make unrar-free autoconf automake libtool gcc g++ gperf \
    flex bison texinfo gawk ncurses-dev libexpat-dev sed git unzip bash help2man wget bzip2
