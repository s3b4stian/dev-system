#!/bin/bash

RED='\e[91m'
YELLOW='\e[93m'
NC='\e[0m'
export DEBIAN_FRONTEND=noninteractive

cd $HOME

## Installing Samba
printf  "\n${RED}Installing Samba${NC}\n"

sudo apt -y install samba
sudo cp ./dev-system/smb/smb.conf /etc/samba/smb.conf
sudo systemctl restart smbd
printf "${YELLOW}";samba --version;printf "${NC}\n"