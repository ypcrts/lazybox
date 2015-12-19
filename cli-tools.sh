#!/bin/sh
set -e
if [ -z "$GXG" ]; then
  echo "Are you Guy Hughes? [N/y]"
  read response
  case "$response" in 
    y|Y|j|1)
      GXG=1
      ;;
    *)
      unset GXG
      ;;
  esac
  unset response
fi
set -x
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
  stow\
  curl\
  info
  # nodejs-legacy\
  # npm
set +x
echo "Changing shell to zsh"
chsh -s /bin/zsh `whoami`

echo "Cloning github.com/ypcrts/dots repo"
vcsh clone https://github.com/ypcrts/dots dots

if [ -z "$GXG" ]; then
  echo "This script wants to \`git stash\` any files in the home directory that conflict with github.com/ypcrts/dots"
  echo "Do you want to continue? [Y/n]"
  read response
fi
case "$response" in 
    N)
      unset stashthestuff
      ;;
    y|Y|j|1)
      stashthestuff=1
      ;;
esac
if [ "$GXG" = 1 ] || [ "$stashthestuff" = 1 ]; then
  git checkout -b before-you-cloned
  vcsh dots
  vcsh dots stash
  vcsh dots checkout .
fi
if [ "$GXG" = 1 ]; then 
  vcsh dots remote rm origin
  vcsh dots remote add origin gh:ypcrts/dots
fi
