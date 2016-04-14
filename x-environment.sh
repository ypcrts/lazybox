#!/bin/sh
set -e
. ./init.sh
DIR=`pwd`
set -x
sudo apt-get install\
  x11-xserver-utils\
  firefox-esr\
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
  xdotool\
  xfonts-terminus xfonts-terminus-oblique\
  ttf-mscorefonts-installer fonts-cantarell fonts-cabin fonts-ebgaramond fonts-ebgaramond-extra fonts-jura fonts-lato fonts-linuxlibertine fonts-oxygen fonts-powerline\
  redshift

# Dependencies for sxhkd and bspwm
# https://github.com/windelicato/dotfiles/wiki/bspwm-for-dummies
sudo apt-get install xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev

# Force firefox to use hardware rendering
sudo cp x-environment/90-firefox /etc/X11/Xsession.d/

set +x

cd "$PWD"
./x-environment-bspwm.sh

cd "$PWD"
./x-environment-sxhkd.sh

# Xdots with vcsh
cd ~
vcsh clone https://github.com/ypcrts/Xdots Xdots

echo "Committing current dot files to before-you-cloned branch"
vcsh Xdots checkout -b before-you-cloned
vcsh Xdots add -A
vcsh Xdots commit -m 'automatic x-environment.sh commit'

echo "Checking out mater"
vcsh Xdots checkout master

if [ "$GXG" = 1 ]; then 
  vcsh Xdots remote rm origin
  vcsh Xdots remote add origin gh:ypcrts/Xdots
fi
