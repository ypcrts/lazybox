#!/bin/sh
# This is debian specific
set -eu
if [ "$(id -u)" -ne 0 ]]; then
  echo 'need root'
  exit 13
fi

set -x
rm -rf /etc/apt/sources.list* /etc/apt/preferences*
mkdir -p /etc/apt/sources.list.d /etc/apt/preferences.d
cp assets_apt/stable.pref /etc/apt/preferences.d/
cp assets_apt/stable.list /etc/apt/sources.list.d/
