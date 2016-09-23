#!/bin/bash
set -e
. ./init.sh
assert_is_root
set -x
declare -a pkgs
pkgs+=(policykit-1 xscreensaver lxappearance arandr qt4-qtconfig surfraw surfraw-extra)

set +x
apt-get install "${pkgs[@]}"

