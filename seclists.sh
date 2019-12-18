#!/bin/sh
set -ex

[ `id -u` -eq 0 ]

cd /usr/share
[ ! -d ./seclists ]

git clone --depth 1 https://github.com/danielmiessler/SecLists seclists

cd /usr/share/seclists/Passwords/Leaked-Databases
tar xzvf rockyou.txt.tar.gz
cd ../../
ln -s Passwords/Leaked-Databases/rockyou.txt
