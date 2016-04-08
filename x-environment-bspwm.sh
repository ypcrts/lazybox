#!/bin/sh
set -xe
git clone --depth 1 git://github.com/baskerville/bspwm.git ./bspwm && cd bspwm || cd bspwm # && git pull origin master
git fetch --tags
git checkout 0.9.1

make PREFIX=/usr/local

echo "make install? [y/N]"
read n
case "$n" in
  "y"|"Y"|"J")
    ;;
  *)
    exit 1
    ;;
esac

sudo make PREFIX=/usr/local/stow/bspwm install
sudo stow -d /usr/local/stow -S bspwm
