
#!/bin/bash
set -eux
echo Use just nix
nix-env -i neovim

# # sudo yum install -y cmake python3-{devel,pip}
# git clone https://github.com/neovim/neovim.git
# cd neovim
# git checkout stable
# # git checkout `git describe --abbrev=0 --tags`
# make CMAKE_BUILD_TYPE=Release
# echo if you want: sudo make install
