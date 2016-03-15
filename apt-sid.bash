#!/bin/bash
set -x
set -e

sudo mkdir -p /etc/apt/sources.list.d
sudo rm -f /etc/apt/sources.list
sudo rm -f /etc/apt/sources.list.d/*
sudo cp ./apt/all.list /etc/apt/sources.list.d/
sudo cp ./apt/security.list /etc/apt/sources.list.d/
sudo chmod 0644 /etc/apt/sources.list.d/*

sudo mkdir -p /etc/apt/preferences.d
sudo rm -f /etc/apt/preferences
sudo rm -f /etc/apt/preferences.d/*
sudo cp ./apt/sid.pref /etc/apt/preferences.d/sid.pref
sudo chmod 0644 /etc/apt/preferences.d/*

sudo apt-get clean
sudo apt-get update

sudo apt-get upgrade
sudo apt-get dist-upgrade
