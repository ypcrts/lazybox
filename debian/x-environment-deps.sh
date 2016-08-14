#!/bin/bash
set -e
. ./init.sh
assert_is_root
set -x
declare -a pkgs
pkgs+=(lxappearance arandr qt4-qtconfig)

set +x
apt-get install "${pkgs[@]}"

