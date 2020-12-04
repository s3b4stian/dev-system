#!/bin/bash

source config.sh

cd /home/$USER

## Configuring Netplan
## -------------------
sudo cp /home/$USER/dev-system/netplan/50-cloud-init.yaml /etc/netplan/50-cloud-init.yaml

sudo netplan apply
printf "${YELLOW}";ip a;printf "${NC}\n"