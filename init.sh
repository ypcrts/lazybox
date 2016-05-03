#!/bin/sh
### This script is dotsourced by sh or bash
set -e

do_init () {
  GXG=0
  GXG_INTERACTIVE=0
  case $- in
    *i*)
      GXG_INTERACTIVE=1
      ;;
    *)
      GXG_INTERACTIVE=0

      echo "The quiet defaults are to install all the things."
      echo -n "Run with sane prompts? [y/N]\t"
      read response
      case "$response" in
        y|Y|j|1)
          GXG=1
          ;;
        *)
          GXG=0
          ;;
      esac
      unset response
      ;;
  esac
}

if [ -z "$GXG" ] || [ -z "$GXG_INTERACTIVE"  ]; then
  do_init
fi

unset -f do_init
