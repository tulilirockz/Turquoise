#!/bin/sh
firewall-cmd --permanent --remove-port=1025-65535/udp
firewall-cmd --permanent --remove-port=1025-65535/tcp
firewall-cmd --permanent --remove-service=mdns
firewall-cmd --permanent --remove-service=ssh
firewall-cmd --permanent --remove-service=samba-client