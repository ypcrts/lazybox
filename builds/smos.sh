#!/bin/sh
set -eux
sudo apt-get install libtinfo-dev
cd ~
mkdir -p Projects
cd Projects
git clone https://github.com/NorfairKing/smos
cd smos
stack upgrade
stack install autoexporter
stack install smos
