#!/bin/sh
echo Clone repo...
if [ -d ~/tools ]; then
  echo '~/tools exists, skipping'
else
  git clone github:ypcrts/tools ~/tools
fi

echo ''
echo "NB zardus depends on:  debian/apt.py --with-all"

