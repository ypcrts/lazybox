. ./init.sh
set -xe
git clone https://github.com/baskerville/sxhkd.git ./sxhkd || /bin/true
cd ./sxhkd && git fetch --all --tags

# keep pointer motions support
git checkout 0.5.7

make PREFIX=/usr/local

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
STOW_DIR=/usr/local/stow stow sxhkd
