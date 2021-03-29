#!/bin/sh
set -eux
sudo mkdir -m 0755 /nix && sudo chown $USER /nix
curl -L https://nixos.org/nix/install > nixinstall.sh
echo cat nixinstall.sh then run
