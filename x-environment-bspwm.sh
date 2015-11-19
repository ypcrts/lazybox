#!/bin/sh
set -xe
git clone git://github.com/baskerville/bspwm.git ./bspwm && cd bspwm || cd bspwm  && git pull origin master
make PREFIX=/usr/local
sudo make PREFIX=/usr/local/stow/bspwm install
