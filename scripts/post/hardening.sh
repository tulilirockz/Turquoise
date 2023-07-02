#!/bin/sh
set -euo pipefail
mkdir -p /usr/etc/systemd/system/{NetworkManager,irqbalance}.service.d

curl -fsSLo \
    /usr/etc/systemd/system/NetworkManager.service.d/99-brace.conf \
    'https://gitlab.com/divested/brace/-/raw/master/brace/usr/lib/systemd/system/NetworkManager.service.d/99-brace.conf'

curl -fsSLo \
    /usr/etc/systemd/system/irqbalance.service.d/99-brace.conf \
    'https://gitlab.com/divested/brace/-/raw/master/brace/usr/lib/systemd/system/irqbalance.service.d/99-brace.conf'

curl -fsSLo \
    /usr/etc/chrony.conf \
    'https://raw.githubusercontent.com/GrapheneOS/infrastructure/main/chrony.conf'