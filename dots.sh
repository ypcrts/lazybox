#!/bin/bash

die () {
  1>&2 echo abort: "$@"
  exit 1
}

if [[ -d ~/Projects/dots ]] || [[ -d ~/dots ]]; then
  die 'dots seems already cloned'
fi


mkdir -p ~/Projects
cd ~/Projects
git clone https://github.com/ypcrts/dots || \
  die 'clone failed'
cd dots
if command -V python 2>&1 >/dev/null;  then
  PYBIN=python
elif command -V python3 2>&1 >/dev/null;  then
  PYBIN=python3
fi

$PYBIN manifest.py -fv install  || \
  die 'manifest install failed'

printf '\nsuccess: dots.sh\n'
