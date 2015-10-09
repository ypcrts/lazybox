#!/bin/bash
set -xe
sudo apt-get install\
  dh-autoreconf\
  gtk2-engines-murrine\
  build-essential\
  automake\
  libgtk-3-dev

sudo rm -rf /usr/share/themes/{Vertex,Vertex-Dark,Vertex-Light,Vertex-Gnome-Shell,Vertex-Gnome-Shell-3.16,Vertex-Cinnamon}
rm -rf ~/.local/share/themes/{Vertex,Vertex-Dark,Vertex-Light,Vertex-Gnome-Shell,Vertex-Gnome-Shell-3.16,Vertex-Cinnamon}
rm -rf ~/.themes/{Vertex,Vertex-Dark,Vertex-Light,Vertex-Gnome-Shell,Vertex-Gnome-Shell-3.16,Vertex-Cinnamon}

rm -rf vertex-theme
git clone https://github.com/horst3180/vertex-theme --depth 1 

cd vertex-theme
git fetch --tags
git checkout $(git describe --tags `git rev-list --tags --max-count=1`)

./autogen.sh --prefix=/usr \
  --disable-cinnamon \
  --disable-metacity \
  --disable-unity \
  --disable-xfwm 

sudo make install
cd ..
rm -rf vertex-theme
