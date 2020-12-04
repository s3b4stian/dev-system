#!/bin/bash

source config.sh

cd /home/$USER

## Installing Samba
## ----------------
printf  "\n${RED}Installing Samba${NC}\n"

sudo apt -y install samba
sudo cp /home/$USER/dev-system/smb/smb.conf /etc/samba/smb.conf
sudo systemctl restart smbd
printf "${YELLOW}";samba --version;printf "${NC}\n"