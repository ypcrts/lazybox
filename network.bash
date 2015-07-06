cp ./network/dhcpipv4.network /etc/systemd/network/
chmod 0644 /etc/systemd/network/*
systemctl enable systemd-network.service
systemctrl start systemd-network.service
