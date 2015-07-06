#!/bin/bash
set -x

rm /etc/apt/sources.list
rm /etc/apt/sources.list.d/*
cp ./apt/all.list /etc/apt/sources.list.d/
cp ./apt/security.list /etc/apt/sources.list.d/
chmod 0644 /etc/apt/sources.list.d/*

rm /etc/apt/preferences
rm /etc/apt/preferences.d/*
cp ./apt/testing.pref /etc/apt/preferences.d/testing.pref
chmod 0644 /etc/apt/preferences.d/*

apt-get clean
apt-get update

apt-get upgrade
apt-get dist-upgrade
