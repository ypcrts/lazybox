set -xe
git clone git://github.com/baskerville/sxhkd.git ./sxkhd && cd sxhkd || cd sxhkd && git pull origin
cd ./sxhkd
make PREFIX=/usr/local
sudo make PREFIX=/usr/local/stow/sxhkd install
cd /usr/local/stow/sxhkd
sudo STOW_DIR=/usr/local/stow stow sxhkd
