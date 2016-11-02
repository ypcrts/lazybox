sudo -v
while true; do sudo -n true; sleep 30; kill -0 "$$" || exit; done 2>/dev/null &

sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off
sudo pkill -HUP socketfilterfw


# brew install dnsmasq --with-dnssec
