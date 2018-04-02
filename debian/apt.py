#!/usr/bin/env python

import argparse
import os

parser = argparse.ArgumentParser(description='install base apt packages')
parser.add_argument('--with-dev', action='store_true')
parser.add_argument('--with-c', action='store_true')
parser.add_argument('--with-rust', action='store_true')
parser.add_argument('-a', '--all', action='store_true')
opts = parser.parse_args()

assert os.geteuid() == 0, "must be root"

packages = ["tmux",
            "screen",
            "lsof",
            "mosh",
            "ssh",
            "git",
            "bash-completion",
            "tree",
            "rsync",
            "curl",
            "pandoc",
            "w3m",
            "w3m-img",
            "ranger",
            "sysfsutils",
            "gnupg",
            "info",
            "vim-nox",
            "htop",
            "powertop", ]


if opts.with_dev or opts.all:
    packages.extend((
        "libncurses5-dev",  # needed to build fzf
        "clang-format",
        "build-essential",
        "python-dev",
        "golang-go",
    ))

if opts.with_c or opts.all:
    packages.extend(("clang", "cmake", "exuberant-ctags", "cproto",))

if opts.with_rust or opts.all:
    packages.extend((
        "rustc",
        "cargo",
    ))


os.execvp('apt-get', ['apt-get', 'install', '-y'] + packages)

# vi: ft=python:tw=0:ts=8:sw=4:sts=4:fdm=manual et:
