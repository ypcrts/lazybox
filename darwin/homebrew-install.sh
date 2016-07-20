#!/bin/sh
THEFILE=/tmp/brewinst
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install > "$THEFILE"
less "$THEFILE"
ruby -e "$THEFILE"

