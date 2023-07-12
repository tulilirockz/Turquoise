#!/bin/sh
set -oue pipefail
echo -e "[device]\nwifi.backend=iwd" | tee -a /etc/NetworkManager/conf.d/iwd.conf
echo -e "[device]\nwifi.scan-rand-mac-address=no" | tee -a /etc/NetworkManager/conf.d/rtl8xxxu_workaround.conf
