#!/bin/sh
echo -e "[device]\nwifi.scan-rand-mac-address=no" | tee -a /etc/NetworkManager/NetworkManager.conf
echo "wifi.scan-rand-mac-address=no" | tee -a /etc/NetworkManager/NetworkManager.conf
