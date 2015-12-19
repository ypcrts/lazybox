#!/bin/sh
set -e
if [ -z "$GXG" ]; then
  echo "Are you Guy Hughes? [N/y]"
  read response
  case "$response" in 
    N)
      unset GXG
      ;;
    y|Y|j|1)
      GXG=1
      ;;
  esac
  unset response
fi
DIR=`pwd`
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

cd "$PWD"
./x-environment-bspwm.sh

cd "$PWD"
./x-environment-sxhkd.sh

# Xdots with vcsh
cd ~
vcsh clone https://github.com/ypcrts/Xdots Xdots

if [ -z "$GXG" ]; then
  echo "This script wants to \`git stash\` any files in the home directory that conflict with github.com/ypcrts/dots"
  echo "Do you want to continue? [Y/n]"
  read response
  case "$response" in 
    N)
      unset stashthestuff
      ;;
    y|Y|j|1)
      stashthestuff=1
      ;;
  esac
fi

if [ "$GXG" = 1 ] || [ "$stashthestuff" = 1 ]; then
  vcsh Xdots checkout -b before-you-cloned
  vcsh Xdots add -a
  vcsh Xdots commit -m 'automatic x-environment.sh commit'
  vcsh Xdots checkout master -- .
fi

if [ "$GXG" = 1 ]; then 
  vcsh Xdots remote rm origin
  vcsh Xdots remote add origin gh:ypcrts/Xdots
fi
