#!/bin/sh
set -oue pipefail
echo -e "wifi.backend=iwd" | tee -a /etc/NetworkManager/NetworkManager.conf
