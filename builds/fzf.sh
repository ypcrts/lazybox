#!/bin/sh
set -eux

echo Debian buster has fzf now

if [ -d ~/.fzf ]; then
  rm -rf ~/.fzf
fi

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --bin

