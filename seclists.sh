#!/bin/sh
set -ex

[ `id -u` -eq 0 ]

cd /usr/share
[ ! -d ./seclists ]

git clone https://github.com/danielmiessler/SecLists seclists

cd /usr/share/seclists/Passwords/Leaked-Databases
tar xzvf rockyou.tar.gz
