#!/bin/bash

DEBIAN_FRONTEND=noninteractive

## Update and Upgrade
sudo apt -y update
sudo apt -y upgrade

## Installing Samba
sudo apt -y install samba
sudo cp ./smb/smb.conf /etc/samba/smb.conf

## Installing Docker and docker-compose
sudo apt -y install docker docker.io docker-compose

## Installing Git
sudo apt -y install git

## Installing python3 dependencies
sudo apt -y install python3-pip

pip3 install argcomplete

## Cloning repos
python3 ./repo_clone.py --from linna --type organization --dir /home/sebastian/html


## Installing PHP DEV environment