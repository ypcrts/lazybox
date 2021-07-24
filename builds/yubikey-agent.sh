#!/bin/sh
set -eux


# install go
command -v go || {
  echo 'no go, lawl\nyou have a sense of humor'
  exit 126
}


# install piv-go deps
# https://github.com/go-piv/piv-go#installation
command -v apt-get || {
  echo 'install libpcsclite-dev somehow'
  exit 126
}
sudo apt-get install libpcsclite-dev pcscd


# https://github.com/FiloSottile/yubikey-agent/blob/main/systemd.md
rm -rf yubikey-agent
git clone https://github.com/FiloSottile/yubikey-agent.git
cd yubikey-agent
go build
sudo cp yubikey-agent /usr/local/bin
mkdir -p ~/.config/systemd/user
cp contrib/systemd/user/yubikey-agent.service ~/.config/systemd/user
systemctl daemon-reload --user
sudo systemctl enable --now pcsd.socket
systemctl --user enable --now yubikey-agent
echo '\n...\nexport SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/yubikey-agent/yubikey-agent.sock"'
