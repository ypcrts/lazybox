#!/bin/bash
set -xe

git clone https://github.com/numixproject/numix-icon-theme

echo "make install? [y/N]"
read n
case "$n" in
  "y"|"Y"|"J")
    ;;
  *)
    exit 1
    ;;
esac

sudo install -dm 755 /usr/share/icons
sudo cp -dr --no-preserve='ownership' numix-icon-theme/Numix{,-Light} /usr/share/icons/
rm -rf numix-icon-theme
