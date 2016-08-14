#!/bin/sh
set -xe
. ./init.sh

assert_is_root

#{{{1 APT Sources
rm -vf /etc/apt/sources.list
# rm -f /etc/apt/sources.list.d/*

# mkdir -p /etc/apt/sources.list.d
# cp ./apt/sid.list /etc/apt/sources.list.d/
# cp ./apt/security.list /etc/apt/sources.list.d/
# chmod 0644 /etc/apt/sources.list.d/*
install -vD -m 0644 -t /etc/apt/sources.list.d ./apt/sid.list ./apt/security.list


#{{{1 APT Preferences
rm -vf /etc/apt/preferences
# rm -f /etc/apt/preferences.d/*

# mkdir -p /etc/apt/preferences.d
# chmod 0644 /etc/apt/preferences.d/*
install -vD -m 0644 -t /etc/apt/preferences.d ./apt/sid.pref

apt-get clean
apt-get update
apt-get upgrade
apt-get dist-upgrade
