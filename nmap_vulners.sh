#!/binsh

set -xe

[ `id -u` -eq 0 ]

mkdir -p /usr/local/share/nmap/scripts /usr/share/nmap/scripts

cd /usr/local/share/nmap/scripts/
git clone https://github.com/vulnersCom/nmap-vulners

cd /usr/share/nmap/scripts
ln -s /usr/local/share/nmap/scripts/nmap-vulners
  

