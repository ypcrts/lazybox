#!/bin/sh
echo Clone repo...
if [ -d ~/Projects/tools ]; then
  1>&2 echo 'abort: ~/Projects/tools exists'
  exit 2
else
  mkdir -P ~/Projects
  git clone --recursive git@github.com:ypcrts/tools ~/Projects/tools
fi

