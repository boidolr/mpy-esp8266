#!/usr/bin/env python3
import urllib.request as request
import pathlib


modules = (
    "https://raw.githubusercontent.com/micropython/micropython/master/ports/esp8266/modules/ntptime.py",  # noqa: E501
    "https://raw.githubusercontent.com/pfalcon/pycopy-lib/master/urllib.urequest/urllib/urequest.py",  # noqa: E501
)


def download(entries, target_path):
    for entry in entries:
        n = pathlib.Path(entry)
        target = target_path.joinpath(n.name)
        with request.urlopen(entry) as f, target.open("wb") as out:
            for line in f:
                out.write(line)


if __name__ == "__main__":
    download(modules, pathlib.Path(".", "modules"))
