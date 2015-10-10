#!/bin/bash
set -xe

rm -rf bar
git clone git://github.com/lemonboy/bar
cd bar

sudo install -dm 655 /usr/local/stow/lemonbar
sudo make PREFIX=/ DESTDIR=/usr/local/stow/lemonbar install

sudo stow -d /usr/local/stow -S lemonbar
cd ..
rm -rf bar
