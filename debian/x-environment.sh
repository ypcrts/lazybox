#!/bin/sh
# target: debian stretch, jessie
apt-get install\
  x11-xserver-utils xinit xdg-utils xdotool\
  policykit-1 xscreensaver \
  lxappearance arandr qt4-qtconfig \
  surfraw surfraw-extra \
  bspwm sxhkd lemonbar \
  dunst libnotify-bin\
  dmenu\
  rxvt-unicode-256color\
  make\
  build-essential\
  fonts-croscore\
  xsel xinput\
  suckless-tools xautolock\
  imagemagick\
  scrot\
  compton feh rofi\
  firefox-esr chromium\
  vim-gtk\
  xfonts-terminus xfonts-terminus-oblique\
  ttf-mscorefonts-installer fonts-cantarell fonts-cabin fonts-ebgaramond fonts-ebgaramond-extra fonts-jura fonts-lato fonts-linuxlibertine fonts-oxygen fonts-powerline\
  redshift

( ./x-environment-gtk-icons.sh )

( ./x-environment-gtk-theme.sh )

( ./x-environment-siji-font.sh )

# # Dependencies for sxhkd and bspwm
# # https://github.com/windelicato/dotfiles/wiki/bspwm-for-dummies
# apt-get install xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev


