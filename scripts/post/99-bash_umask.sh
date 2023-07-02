#!/bin/sh
set -euo pipefail

umask 077
sed -i 's/umask 002/umask 077/g' /etc/bashrc
sed -i 's/umask 022/umask 077/g' /etc/bashrc
