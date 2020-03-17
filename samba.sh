#!/bin/bash

cd /home/$USER/

## Installing Samba
sudo apt -y install samba
sudo cp ./dev-system/smb/smb.conf /etc/samba/smb.conf

sudo systemctl restart smbd