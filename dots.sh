#!/bin/bash

die () {
  1>&2 echo abort: "$@"
  exit 1
}

if [[ -d ~/Projects/dots ]] || [[ -d ~/dots ]]; then
  die 'dots seems already cloned'
fi


mkdir -P ~/Projects
cd ~/Projects
git clone https://github.com/ypcrts/dots || \
  die 'clone failed'
cd dots
python manifest.py -fv install  || \
  die 'manifest install failed'

printf '\nsuccess: dots.sh\n'
