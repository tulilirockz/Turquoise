#!/bin/sh
set -oue pipefail
echo -e "[device]\nwifi.backend=iwd" | tee -a /etc/NetworkManager/conf.d/iwd.conf
