#!/bin/sh
set -xe

git clone github:lemonboy/bar ./lemonbar && cd ./lemonbar || cd ./lemonbar && git pull origin 

make all

echo "make install? [y/N]" 
read n
case "$n" in 
  "y"|"Y"|"J")
    ;;
  *)
    exit 1
    ;;
esac

sudo install -dm 655 /usr/local/stow/lemonbar
sudo make PREFIX=/ DESTDIR=/usr/local/stow/lemonbar install
sudo stow -d /usr/local/stow -S lemonbar
