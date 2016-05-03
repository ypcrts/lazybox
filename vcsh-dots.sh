#!/bin/sh
. ./init.sh

if ! command -V git 2>/dev/null >/dev/null || ! command -V vcsh 2>/dev/null >/dev/null; then
  ./cli-tools.sh
fi

echo "Cloning github.com/ypcrts/dots repo"
vcsh clone https://github.com/ypcrts/dots dots

echo "Checking out master"
vcsh dots branch master origin/master
vcsh dots checkout master -- .

if [ "$GXG" -eq 1 ]; then
  vcsh dots remote rm origin
  vcsh dots remote add origin gh:ypcrts/dots
fi
