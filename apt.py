#!/usr/bin/env python
# vi: ft=python:tw=0:ts=8:sw=4:sts=4:fdm=manual et:
"""
debian/ubuntu 20LTS
"""

import argparse
import os
import subprocess

parser = argparse.ArgumentParser(description="install base apt packages")
parser.add_argument("--with-dev", action="store_true")
parser.add_argument("--with-gui", action="store_true")
parser.add_argument("--with-c", action="store_true")
parser.add_argument("--with-i386", action="store_true")
parser.add_argument("-a", "--all", action="store_true")
opts = parser.parse_args()

assert os.geteuid() == 0, "must be root"

is_ubuntu = False
release_path = "/etc/os-release"
if os.path.isfile(release_path):
    with open(release_path) as release_fp:
        for line in release_fp:
            if "Ubuntu" in line:
                is_ubuntu = True
                break

# target: buster
packages = set()
packages.update(
    (
        "tmux",
        "fzf",
        "screen",
        "lsof",
        "mosh",
        "ssh",
        "git",
        "subversion",
        "bash-completion",
        "tree",
        "rsync",
        "curl",
        "wget",
        "pandoc",
        "w3m",
        "w3m-img",  # bloat needed by ranger?
        "lsb-release",
        "ranger",
        "unzip",
        "sysfsutils",
        "dnsutils",
        "gnupg",
        "ripgrep",
        "info",
        "black",
        "isort",
        "pylint",
        "jq",
        "vim-nox",
        "neovim",
        "htop",
        "virtualenvwrapper",
        "powertop",
    )
)


if opts.with_dev or opts.all:
    packages.update(
        (
            "libncurses5-dev",  # needed to build fzf
            "clang-format",
            "python-dev",
            "golang-go",
            "build-essential",  # zardus prereqs
            "libtool",
            "g++",
            "gcc",
            "texinfo",
            "automake",
            "autoconf",
            "magic-wormhole",
            "rustc",
            "cargo",
            "clang",
            "cmake",
            "exuberant-ctags",
            "cproto",
        )
    )

if opts.with_gui or opts.all:
    packages.update(
        (
            "x11-xserver-utils",
            "xinit",
            "xdg-utils",
            "xdotool",
            "policykit-1",
            "xscreensaver",
            "lxappearance",
            "arandr",
            "qt4-qtconfig",
            "surfraw",
            "surfraw-extra",
            "bspwm",
            "sxhkd",
            "lemonbar",
            "dunst",
            "libnotify-bin",
            "dmenu",
            "rxvt-unicode-256color",
            "make",
            "build-essential",
            "fonts-croscore",
            "xsel",
            "xinput",
            "suckless-tools",
            "xautolock",
            "imagemagick",
            "scrot",
            "compton",
            "feh",
            "rofi",
            "firefox-esr",
            "chromium",
            "xfonts-terminus",
            "xfonts-terminus-oblique",
            "ttf-mscorefonts-installer",
            "fonts-cantarell",
            "fonts-cabin",
            "fonts-ebgaramond",
            "fonts-ebgaramond-extra",
            "fonts-jura",
            "fonts-lato",
            "fonts-linuxlibertine",
            "fonts-oxygen",
            "fonts-powerline",
            "redshift",
        )
    )


if opts.with_i386 or opts.all:
    print("\nADDING i386 ARCH")
    subprocess.call(["dpkg", "--add-architecture", "i386"])

if is_ubuntu:
    packages -= {"qt4-qtconfig", "firefox-esr", "chromium", "ttf-mscorefonts-installer"}


print("\nAPT UPDATE")
subprocess.call(["apt-get", "update"])

print("\nAPT INSTALL")
cmd = ["apt-get", "install", "-y"]
cmd.extend(packages)
print(cmd)
os.execvp(cmd[0], cmd)
