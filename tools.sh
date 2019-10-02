#!/bin/sh
echo Clone repo...
if [ -d ~/Projects/tools ]; then
  1>&2 echo 'abort: ~/Projects/tools exists'
  exit 2
else
  mkdir -P ~/Projects
  git clone --recursive github:ypcrts/tools ~/Projects/tools
fi

echo ''
echo "NB zardus depends on:  debian/apt.py --with-all"

