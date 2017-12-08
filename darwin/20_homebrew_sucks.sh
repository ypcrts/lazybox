#!/bin/sh

THEFILE=/tmp/brewinst
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install > "$THEFILE"
vi "$THEFILE"

echo 'use ports - this sucks'
echo '\n\ncontinue?\n'
read mail_lel

ruby -e "$THEFILE"
rm "$THEFILE"

brew tap caskroom/cask
brew tap homebrew/core
brew tap homebrew/dupes
brew tap homebrew/services

brew install vim  --with-lua --with-override-system-vi

brew install \
  coreutils binutils diffutils findutils  \
  gnupg2 gnu-sed gnu-tar grep rename \
  --with-default-names

brew install reattach-to-user-namespace --wrap-pbcopy-and-pbpaste

brew install python python3 pyenv-virtualenvwrapper

<brewlist.txt xargs brew install
<casklist.txt xargs brew cask install
