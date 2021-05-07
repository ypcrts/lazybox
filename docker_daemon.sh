#!/bin/bash

[[ $EUID -eq  0 ]] || exit 3

TARGET=/etc/docker/daemon.json

writefile () {

  cat >"$TARGET" <<- EOF
  {
    "bip": "240.10.0.1/24",
    "fixed-cidr": "240.10.0.0/24",
    "dns-search": [],
    "default-address-pools":[{"base":"240.11.0.0/16","size":24}],
    "registry-mirrors": ["https://public.ecr.aws"]
  }
EOF

}


if [[ ! -f "$TARGET" ]]; then
  >&2 echo "writing $TARGET"
  writefile
  exit $?
fi

if [[ "$1" == "-f" ]]; then
  >&2 echo "forcing write to $TARGET"
  writefile
  exit $?
fi
