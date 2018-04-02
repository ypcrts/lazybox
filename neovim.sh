#!/bin/sh


for i in 1..100; do
  echo "INCOMPLETE CONCEPT SCRIPT"
done

exit 99

TARGET=~/Projects/neovim

git clone https://github.com/neovim/neovim.git $TARGET

ln -sr ./neovim/local.mk $TARGET

cd $TARGET

# this is wrong:
#make ypcrtsdeps ypcrtsrel

