#!/bin/bash
set -xe

sudo apt-get install \
  xfonts-terminus \
  xfonts-terminus-oblique

rm -rf siji
git clone git://github.com/gstk/siji
cd siji
sudo ./install.sh -d /usr/local/stow/siji/share/fonts
sudo install -d -m755 /usr/local/share/fonts
sudo stow -d /usr/local/stow -S siji
sudo chmod +rx /usr/local/share/fonts
cd ..
rm -rf siji

xset +fp /usr/local/share/fonts
xset fp rehash
fc-cache -f
xset q

