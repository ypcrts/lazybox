#!/bin/sh

rm -rf /etc/apt/sources.list* /etc/apt/preferences*
mkdir -p /etc/apt/source.list.d /etc/apt/preferences.d
cp apt/stable.pref /etc/apt/preferences.d/
cp apt/stretch.list /etc/apt/preferences.d/
