#!/bin/sh
set -xe
DIR=`pwd`
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
  xinput\
  suckless-tools\
  xautolock\
  i3lock\
  imagemagick\
  scrot\
  compton\
  feh\
  rofi\
  ttf-mscorefonts-installer fonts-cantarell fonts-cabin fonts-ebgaramond fonts-ebgaramond-extra fonts-jura fonts-lato fonts-linuxlibertine fonts-oxygen fonts-powerline\
  redshift

# Dependencies for sxhkd and bspwm
# https://github.com/windelicato/dotfiles/wiki/bspwm-for-dummies
sudo apt-get install xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev

# install force firefox to use hardware rendering
sudo cp x-environment/90-firefox /etc/X11/Xsession.d/

./x-environment-bspwm.sh
sudo STOW_DIR=/usr/local/stow stow bspwm

cd $PWD
./x-environment-sxhkd.sh
sudo STOW_DIR=/usr/local/stow stow sxhkd

# Xdots with vcsh
cd ~
vcsh clone https://github.com/ypcrts/Xdots Xdots
vcsh Xdots stash
vcsh Xdots checkout master -- .
vcsh Xdots remote rm origin
vcsh Xdots remote add origin gh:ypcrts/Xdots
