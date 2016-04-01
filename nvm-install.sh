#!/bin/sh
set -xe
if [ -d ~/.nvm ]; then
  exit 1
fi
git clone https://github.com/creationix/nvm.git ~/.nvm
cd ~/.nvm
git checkout `git describe --abbrev=0 --tags`
