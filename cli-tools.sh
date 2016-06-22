#!/bin/bash
set -e
. ./init.sh
assert_is_root
set -x
declare -a pkgs
#pkgs+=(lsb-release) # no longer needed by my dots  [Guy Hughes // 20160503T0406Z]
pkgs+=(vcsh tmux git ssh bash-completion tree)
pkgs+=(rsync curl sysfsutils info)
pkgs+=(vim-nox)
pkgs+=(htop powertop)

set +x
apt-get install "${pkgs[@]}"

