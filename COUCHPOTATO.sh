#!/bin/sh
./dots.sh &
./fzf.sh &
./debian/apt.py -a
./ripgrep.sh
./tools.sh
