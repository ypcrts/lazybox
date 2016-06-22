#!/bin/sh
### This script is dotsourced by sh or bash
set -e

# LIBRARY FUNCTIONS
assert_is_root () { 
  if [ "$(id -u)" != 0 ]; then
    echo 'fatal: run as root'
    exit 1
  fi 
}
assert_is_not_root () {
  if [ "$(id -u)" == 0 ]; then
    echo 'fatal: excess privilege use violation'
    exit 1
  fi 
}

# MAIN FUNCTION
do_init () {
  [ -n "$GXG" ] || GXG=0
  [ -n "$GXG_INTERACTIVE" ] || GXG_INTERACTIVE=0
  case $- in
    *i*)
      GXG_INTERACTIVE=1
      ;;
    *)
      GXG_INTERACTIVE=0

      printf "\n"
      echo "The quiet defaults are to install all the things."
      printf "Run with sane prompts? [y/N]\t"
      read response
      printf "\n"
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

# PROCEDURAL

if [ -z "$GXG" ] || [ -z "$GXG_INTERACTIVE"  ]; then
  do_init
fi

unset -f do_init
