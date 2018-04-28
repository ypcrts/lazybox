#!/bin/sh
./fzf.sh &
./debian/apt_sources.sh
./debian/apt.py -a
./ripgrep.sh
./tools.sh
