#!/bin/sh

set -xe

[ `id -u` -eq 0 ]

# https://medium.com/@balaji.gopal7/perform-curl-to-outdated-ssl-tls-versions-from-latest-kali-machine-d285a189eb70^
sed -i.bk -re 's:^\s*MinProtocol\s+=\s+.*$:MinProtocol = TLSv1.0:' /etc/ssl/openssl.cnf
