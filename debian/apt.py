#!/usr/bin/env python

import argparse
import os

parser = argparse.ArgumentParser(description='install base apt packages')
parser.add_argument('--with-dev', action='store_true')
parser.add_argument('--with-c', action='store_true')
parser.add_argument('-a', '--all', action='store_true')
opts = parser.parse_args()

assert os.geteuid() == 0, "must be root"

packages = ["tmux",
            "mosh",
            "git",
            "ssh",
            "bash-completion",
            "tree",
            "rsync",
            "curl",
            "sysfsutils",
            "info",
            "vim-nox",
            "htop",
            "powertop", ]


if opts.with_dev or opts.all:
    packages.extend((
        "libncurses5-dev",  # needed to build fzf
        "gnupg",
        "clang-format",
        "build-essential",
        "python-dev",
        "silversearcher-ag",))

if opts.with_c or opts.all:
    packages.extend(("clang", "cmake", "exuberant-ctags", "cproto",))

os.execvp('apt-get', ['apt-get', 'install', '-y'] + packages)

# vi: ft=python:tw=0:ts=8:sw=4:sts=4:fdm=manual et:
