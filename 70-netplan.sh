#!/bin/bash

RED='\e[91m'
YELLOW='\e[93m'
NC='\e[0m'
export DEBIAN_FRONTEND=noninteractive

cd $HOME

## Configuring Netplan
## -------------------
sudo cp ./dev-system/netplan/50-cloud-init.yaml /etc/netplan/50-cloud-init.yaml

sudo netplan apply
printf "${YELLOW}";ip a;printf "${NC}\n"