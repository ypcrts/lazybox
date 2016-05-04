#!/bin/sh
set -xe
if [ -d ~/.nvm ]; then
  printf "\nnvm already installed"
  exit 0
fi
git clone github:creationix/nvm.git ~/.nvm
cd ~/.nvm
git checkout `git describe --abbrev=0 --tags`
printf "\nnvm install complete\nUse \`loadenv nvm\` to get started."
