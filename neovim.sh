#!/bin/sh

TARGET=~/Projects/neovim

git clone https://github.com/neovim/neovim.git $TARGET

ln -sr ./neovim/local.mk $TARGET

cd $TARGET

make ypcrtsdeps ypcrtsrel

