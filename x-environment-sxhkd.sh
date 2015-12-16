set -xe
git clone git://github.com/baskerville/sxhkd.git ./sxhkd && cd ./sxhkd || cd ./sxhkd && git pull origin
make PREFIX=/usr/local

echo "make install? [y/N]"
read n
case "$n" in
  "y"|"Y"|"J")
    ;;
  *)
    exit 1
    ;;
esac

sudo make PREFIX=/usr/local/stow/sxhkd install
cd /usr/local/stow/sxhkd
sudo STOW_DIR=/usr/local/stow stow sxhkd
