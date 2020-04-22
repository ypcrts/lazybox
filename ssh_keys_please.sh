#!/bin/sh

set -eux
if [ `id -u` -eq 0 ]; then
  echo 'no run as root pls'
  exit 9
fi

mkdir -p ~/.ssh
chown `id -u`:`id -g` ~/.ssh
wget -O- http://github.com/ypcrts.keys >~/.ssh/authorized_keys
chown `id -u`:`id -g` ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys
rm -rf ~/.ssh/authorized_keys2

