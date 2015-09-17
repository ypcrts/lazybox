#!/usr/bin/env bash
set -e
set -x
cp ./network/dhcpipv4.network /etc/systemd/network/
chmod 0644 /etc/systemd/network/*
systemctl enable systemd-networkd.service
systemctl start systemd-networkd.service
echo "WARNING: eth0 <> ensp2097092409384"
