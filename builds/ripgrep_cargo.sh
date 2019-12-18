#!/bin/sh
set -eux
[ `id -u` -ne 0 ] && echo need root && exit 1
command -V cargo || \
  ( apt-get update && apt-get install -y cargo )
cargo install ripgrep
