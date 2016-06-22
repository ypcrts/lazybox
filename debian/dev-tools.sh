#!/bin/bash
declare -a packages
packages+=(libncurses5-dev ) # needed to build fzf
packages+=(silversearcher-ag ) # reminder: you hate life without this [ypcrts // 20160319T2257Z]
packages+=(colordiff )
packages+=(gnupg keychain)
packages+=(stow)
packages+=(cmake exuberant-ctags cproto build-essential)
packages+=(python-dev )  #needed for YouCompleteMe)
set -x
apt-get install "${packages[@]}"
