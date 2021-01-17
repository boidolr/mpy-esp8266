# mpy-esp8266

Building micropython for esp8266 & pybd boards

Setting up the tool chains for the esp8266 on mac was a pain, so I am using a [`Vagrantfile`](Vagrantfile) to manage a VM with the tools.

## Using the image

Create a VM with the `virtualbox` provider by using `vagrant up`.
The scripts provisioning the image and building the firmware are in [`providers`](providers).

The VM will mount the folder containing the `Vagrantfile` as `sources` directory, and copy firmware images into it.
To build the firmware use `vagrant provision --provision-with build-image`.

## Adding modules to the firmware

Python sources that should be baked into the firmware can be added to [`modules`](modules).
If sources from a different location should be added these can be added to [`manifest.py`](manifest.py).
