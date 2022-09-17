#!/bin/bash

source config.sh


## Configuring Netplan
## -------------------
sudo rm /etc/netplan/*.yaml
sudo cp /home/$USER/dev-system/netplan/50-ip-static-22.04.yaml /etc/netplan/50-ip-static-22.04.yaml

sudo netplan apply
printf "${YELLOW}";ip a;printf "${NC}\n"

