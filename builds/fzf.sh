#!/bin/sh
set -eux

echo Debian buster has fzf now

command -V fzf && {
  echo You already have fzf
  exit 0
}

echo You hacked your vimrc do install this as a vim plugin if you don't have that. Remember?

if [ -d ~/.fzf ]; then
  rm -rf ~/.fzf
fi

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --bin

