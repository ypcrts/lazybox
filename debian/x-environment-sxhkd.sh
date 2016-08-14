. ./init.sh
set -xe
git clone https://github.com/baskerville/sxhkd.git ./sxhkd && cd ./sxhkd || cd ./sxhkd && git fetch --all
git clone https://github.com/baskerville/sxhkd.git ./sxhkd && cd ./sxhkd || cd ./sxhkd && git fetch --all
make PREFIX=/usr/local

# keep pointer motions support
git fetch --tags origin
# git checkout 0.5.5
git checkout 0.5.6

if [ "$GXG" -ne 0 ]; then
  echo "make install? [y/N]"
  read n
  case "$n" in
    "y"|"Y"|"J")
      ;;
    *)
      exit 0
      ;;
  esac
fi

sudo make PREFIX=/usr/local/stow/sxhkd install
cd /usr/local/stow/sxhkd
sudo STOW_DIR=/usr/local/stow stow sxhkd
