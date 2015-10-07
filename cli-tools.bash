#!/usr/bin/env bash
set -e
sudo apt-get install\
  lsb-release\
  vcsh\
  htop\
  powertop\
  tmux\
  git\
  gnupg\
  ssh\
  zsh\
  vim-nox\
  rsync\
  keychain\
  stow
  # nodejs-legacy\
  # npm

chsh -s /bin/zsh `whoami`
vcsh clone https://github.com/ypcrts/dots dots
vcsh dots reset --hard origin/master
vcsh dots remote rm origin
vcsh dots remote add origin gh:ypcrts/dots
