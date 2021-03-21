#!/bin/sh

# tools
sudo dnf -y install fish
sudo dnf -y install libX11-devel
sudo dnf -y install vim
sudo dnf -y install htop

# docker
sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
sudo firewall-cmd --permanent --zone=trusted --add-interface=docker0
sudo firewall-cmd --permanent --zone=FedoraWorkstation --add-masquerade
sudo dnf install moby-engine docker-compose
sudo systemctl enable docker
sudo groupadd docker
sudo gpasswd -a $USER docker
sudo systemctl restart docker
