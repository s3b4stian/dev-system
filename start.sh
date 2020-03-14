#!/bin/bash

USER=sebastian
DEBIAN_FRONTEND=noninteractive

cd /home/$(USER)/

## Update and Upgrade
sudo apt -y update
sudo apt -y upgrade

## Installing Samba
sudo apt -y install samba
sudo cp ./smb/smb.conf /etc/samba/smb.conf

systemctl restart smbd 

## Installing Docker and docker-compose
sudo apt -y install docker docker.io docker-compose

## Installing Git
sudo apt -y install git

## Installing python3 dependencies
sudo apt -y install python3-pip

pip3 install argcomplete

## Cloning repos
python3 ./dev-system/python/repo_clone.py --from linna --type organization --dir /home/$(USER)/html

## Cleaning
sudo docker rm $(sudo docker ps -a -q)
sudo docker rmi $(sudo docker images -a -q)

## Installing PHP DEV environment
git clone https://github.com/s3b4stian/dev-compose.git

cd dev-compose
sudo docker-compose build
sudo docker-compose up -d
