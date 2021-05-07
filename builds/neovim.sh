#!/bin/bash
set -eux

[[ $EUID = 0 ]] || exit 8

apt-get install -y gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip build-essential

cd /tmp 
git clone --depth 1 https://github.com/neovim/neovim 
cd neovim 
make CMAKE_BUILD_TYPE=RELEASE install
