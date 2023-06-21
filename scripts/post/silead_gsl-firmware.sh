#!/bin/sh
set -euo pipefail

git clone https://github.com/onitake/gsl-firmware /tmp/firmware
mkdir -p /usr/lib/firmware/silead
cp -f /tmp/firmware/firmware/positivo/c464c/*.fw /usr/lib/firmware/silead
