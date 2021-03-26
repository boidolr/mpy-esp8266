# mpy-esp8266

Building [micropython](https://github.com/micropython/micropython/)
for [esp8266](https://www.micropython.org/download/esp8266/) & [pybd](https://www.micropython.org/download/pybd/) boards.

Setting up the tool chains for the esp8266 on mac was a pain, so I am using a [`Vagrantfile`](Vagrantfile) to manage a VM with the tools.

## Using the image

Create a VM with the `virtualbox` provider by using `vagrant up`.
The scripts provisioning the image and building the firmware are in [`providers`](providers).

The VM will mount the folder containing the `Vagrantfile` as `sources` directory, and copy firmware images into it.
To build the firmware use `vagrant provision --provision-with build-image`.

## Adding modules to the firmware

Python sources that should be baked into the firmware can be added to [`modules`](modules).
If sources from a different location should be added these can be added to [`manifest.py`](manifest.py).

## Firmware for esp8266

Install micropython on an esp8266 board:
* [Install firmware](https://docs.micropython.org/en/latest/esp8266/tutorial/intro.html)
* [Development reference](https://docs.micropython.org/en/latest/esp8266/quickref.html)

Steps to follow (backup first!):
```bash
pip3 install esptool
esptool.py --port /dev/tty.usbserial* read_mac
esptool.py --port /dev/tty.usbserial* erase_flash
esptool.py --port /dev/tty.usbserial* --baud 460800 write_flash --flash_size=detect 0 <firmware.bin>
```

## Firmware for pybd

Use [pydfu.py](https://github.com/micropython/micropython/blob/master/tools/pydfu.py) from micropython:

```bash
pip3 install pyusb pyserial
python3 pydfu.py -u <firmware.dfu>
# -- or via build if mapped to the image --
make BOARD=PYBD_SF2 deploy
```

## Related

* [Prebuild firmeare](http://micropython.org/download/pybd/)
* [Pybd update process](https://github.com/micropython/micropython/wiki/Pyboard-Firmware-Update)
* [Firmware building](https://github.com/micropython/micropython/wiki/Building-Micropython-Binaries)
* [Firmware building on macOS](https://github.com/micropython/micropython/wiki/Micro-Python-on-Mac-OSX)
* [Espressif toolchain setup](https://docs.espressif.com/projects/esp8266-rtos-sdk/en/latest/get-started/macos-setup.html#toolchain-setup)
* https://github.com/fcollova/micropython-docker-build
* https://github.com/flusflas/micropython-builder
* https://github.com/larsks/docker-image-esp-open-sdk
* and others
