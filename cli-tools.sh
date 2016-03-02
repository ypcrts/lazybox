#!/bin/sh
set -e
. ./init.sh
set -x
sudo apt-get install\
  lsb-release\
  vcsh\
  atop\
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
  stow\
  curl\
  sysfsutils\
  info
set +x

if [ "$GXG" != 1 ]; then
  echo "Do you want extended dev tools too? [y/N]\t"
  read a
fi
if [ "$GXG" = 1 ] || [ "$a" = "y" ]; then
  sudo apt-get install\
    cmake\
    exuberant-ctags\
    build-essential\
    nodejs-legacy\
    silversearcher-ag\
    python-dev/ #needed for YouCompleteMe
    npm\
    colordiff
fi


echo "Changing shell to zsh"
chsh -s /bin/zsh `whoami`

echo "Cloning github.com/ypcrts/dots repo"
vcsh clone https://github.com/ypcrts/dots dots

echo "Committing current dot files to before-you-cloned branch"
vcsh dots checkout -b before-you-cloned
vcsh dots add -A
vcsh dots commit -m 'automatic cli-tool.sh commit'

echo "Checking out master"
vcsh dots checkout master

if [ "$GXG" = 1 ]; then
  vcsh dots remote rm origin
  vcsh dots remote add origin gh:ypcrts/dots
fi
