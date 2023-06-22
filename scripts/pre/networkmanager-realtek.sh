#!/bin/sh
set -oue pipefail
echo -e "[device]\nwifi.scan-rand-mac-address=no\nwifi.backend=iwd" | tee -a /etc/NetworkManager/NetworkManager.conf
