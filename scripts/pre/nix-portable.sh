#!/bin/sh
set -euo pipefail
wget -O /usr/bin/nix-portable https://github.com/DavHau/nix-portable/releases/download/v009/nix-portable
chmod +x /usr/bin/nix-portable
chmod +x /usr/bin/nix
