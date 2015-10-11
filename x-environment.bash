#!/bin/bash
set -e
set -x
sudo apt-get install\
  x11-xserver-utils\
  iceweasel\
  xdg-utils\
  libnotify-bin\
  xinit\
  dmenu\
  rxvt-unicode-256color\
  stow\
  make\
  build-essential\
  fonts-croscore\
  xclip\
  xsel\
  xbacklight\
  xinput

# Dependencies for sxhkd and bspwm
# https://github.com/windelicato/dotfiles/wiki/bspwm-for-dummies
sudo apt-get install xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev

# install force firefox to use hardware rendering
sudo cp x-environment/90-firefox /etc/X11/Xsession.d/

git clone git://github.com/baskerville/sxhkd.git ~/sxkhd
git clone git://github.com/baskerville/bspwm.git ~/bspwm

cd ~/bspwm
make PREFIX=/usr/local
sudo make PREFIX=/usr/local/stow/bspwm install
cd /usr/local/stow/bspwm
sudo stow bspwm

cd ~/sxhkd
make PREFIX=/usr/local
sudo make PREFIX=/usr/local/stow/sxhkd install
cd /usr/local/stow/sxhkd
sudo stow sxhkd

# Xdots with vcsh
vcsh clone https://github.com/ypcrts/Xdots Xdots
vcsh Xdots reset --hard origin/master 
vcsh Xdots remote rm origin
vcsh Xdots remote add origin gh:ypcrts/Xdots
