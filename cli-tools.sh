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
  bash-completion\
  libncurses5-dev\ # needed to build fzf
silversearcher-ag\ # reminder: you hate life without this [ypcrts // 20160319T2257Z]
npm\
  colordiff\
  info
set +x

if [ "$GXG_INTERACTIVE" != 0 ]; then
  echo "Do you want extended dev tools too? [y/N]\t"
  read a
  if [ "$a" = "y" ]; then
    sudo apt-get install\
      cmake\
      exuberant-ctags\
      cproto\
      build-essential\
      nodejs-legacy\
      python-dev #needed for YouCompleteMe
  fi
fi


# I no longer use zsh as default shell [ypcrts // 20160315T2100Z]
# echo "Changing shell to zsh"
# chsh -s /bin/zsh `whoami`

echo "Cloning github.com/ypcrts/dots repo"
vcsh clone https://github.com/ypcrts/dots dots

echo "Committing current dot files to before-you-cloned branch"
vcsh dots checkout -b before-you-cloned
vcsh dots add -A .
vcsh dots commit -m 'automatic cli-tool.sh commit'

echo "Checking out master"
vcsh dots checkout master

if [ "$GXG" = 1 ]; then
  vcsh dots remote rm origin
  vcsh dots remote add origin gh:ypcrts/dots
fi
