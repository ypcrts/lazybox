#!/bin/sh


echo "INCOMPLETE CONCEPT SCRIPT"

exit 99

TARGET=~/Projects/neovim

git clone https://github.com/neovim/neovim.git $TARGET

ln -sr ./neovim/local.mk $TARGET

cd $TARGET

# this is wrong:
#make ypcrtsdeps ypcrtsrel

