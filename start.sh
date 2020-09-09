#!/bin/bash

export USER=sebastian
export DEBIAN_FRONTEND=noninteractive

cd /home/$USER/

## Update and Upgrade
sudo apt -y update
sudo apt -y upgrade

## Installing Docker and docker-compose
sudo apt -y install docker docker.io docker-compose

## Installing Git
sudo apt -y install git

## Installing python3 dependencies
sudo apt -y install python3-pip

pip3 install argcomplete
pip3 install gitpython

## Cloning repos
python3 ./dev-system/python/repo_clone.py --from linna --type organization --dir /home/$USER/html

## Change owner and group
sudo chown -R $USER /home/$USER/html
sudo chgrp -R $USER /home/$USER/html

## Cleaning
sudo docker rm $(sudo docker ps -a -q)
sudo docker rmi $(sudo docker images -a -q)

## Installing PHP DEV environment
git clone https://github.com/s3b4stian/dev-compose.git

cd dev-compose
sudo docker-compose build
sudo docker-compose up -d

## Installing PHP for local tools
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt install -y unzip
sudo apt install -y php7.4-cli php7.4-xml php7.4-mbstring php7.4-zip php-mongodb php7.4-pdo php7.4-mysql php7.4-pgsql php-xdebug php-memcached
sudo apt autoremove

## Installing Postgresql client
curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

sudo apt install -y postgresql-client-12

## Installing Mysql Client
sudo apt install -y mysql-client
