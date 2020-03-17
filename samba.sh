#!/bin/bash

## Installing Samba
sudo apt -y install samba
sudo cp ./smb/smb.conf /etc/samba/smb.conf

systemctl restart smbd