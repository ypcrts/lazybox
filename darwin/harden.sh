sudo -v
while true; do sudo -n true; sleep 30; kill -0 "$$" || exit; done 2>/dev/null &

sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate off
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode off
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode off
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off
sudo pkill -HUP socketfilterfw


# brew install dnsmasq --with-dnssec
