#!/bin/sh
# set -e
# . ./init.sh
# DIR=`pwd`
# set -x
# sudo apt-get install\
  # x11-xserver-utils\
  # chromium\
  # xdg-utils\
  # libnotify-bin\
  # xinit\
  # dmenu\
  # rxvt-unicode-256color\
  # stow\
  # make\
  # build-essential\
  # fonts-croscore\
  # xclip\
  # xsel\
  # xbacklight\
  # xinput\
  # suckless-tools\
  # xautolock\
  # i3lock/unstable\
  # imagemagick\
  # scrot\
  # compton\
  # feh\
  # rofi/unstable\
  # xdotool\
  # iceweasel\
  # vim-gtk\
  # xfonts-terminus xfonts-terminus-oblique\
  # ttf-mscorefonts-installer fonts-cantarell fonts-cabin fonts-ebgaramond fonts-ebgaramond-extra fonts-jura fonts-lato fonts-linuxlibertine fonts-oxygen fonts-powerline\
  # redshift


# #firefox-esr\

# # Dependencies for sxhkd and bspwm
# # https://github.com/windelicato/dotfiles/wiki/bspwm-for-dummies
# sudo apt-get install xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev

# # Force firefox to use hardware rendering
# sudo cp x-environment/90-firefox /etc/X11/Xsession.d/

set +x

cd "$PWD"
./x-environment-bspwm.sh

cd "$PWD"
./x-environment-sxhkd.sh

cd "$PWD"
./x-environment-gtk-icons.sh
cd "$PWD"
./x-environment-gtk-theme.sh
cd "$PWD"
./x-environment-siji-font.sh

