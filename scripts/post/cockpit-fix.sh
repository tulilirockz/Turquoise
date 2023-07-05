#!/bin/sh
set -euo pipefail
# Fixes cockpit "Internal login error" thing!
sed -i 's/is():where()/is(*):where(*)/' /usr/share/cockpit/static/login.js