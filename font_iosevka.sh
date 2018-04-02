#!/bin/sh
set -xeu
__cleanup () {
  rm -f *iosevka*.zip
  rm -rf iosevka
}
__main () {
  __cleanup

  [ `id -u` -ne 0 ] && echo need root && return 1

  curl -JOL --tlsv1.2 https://github.com/be5invis/Iosevka/releases/download/v1.13.3/02-iosevka-term-1.13.3.zip
  unzip *iosevka*.zip -d iosevka

  mkdir -p /usr/share/fonts/truetype
  cp iosevka/ttf/* /usr/share/fonts/truetype

  fc-cache -fv

  __cleanup
}
__main
