#!/bin/sh
echo Clone repo...
if [ -d ~/tools ]; then
  echo '~/tools exists, skipping'
else
  git clone github:ypcrts/tools ~/tools
fi

echo Symlink zardus management script
mkdir -p ~/bin
cd ~/bin

TARGET=~/tools/tools.zardus/bin/manage-tools
if [ ! -x "$TARGET" ]; then
  echo "assertion failed: $TARGET missing +x or does not exist"
  echo "skipping"
else
  ln -sf  "$TARGET" zardus
fi


echo ''
echo "NB zardus depends on:  debian/apt.py --with-all"

