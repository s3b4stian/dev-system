#!/bin/bash

RED='\e[91m'
YELLOW='\e[93m'
NC='\e[0m'
export DEBIAN_FRONTEND=noninteractive

cd $HOME

## Remove other versions of PHP
## ----------------------------
printf  "\n${RED}Remove other versions of PHP${NC}\n"

dpkg -l | grep php | awk '{print $2}' | sudo xargs apt -y remove
dpkg -l | grep '^rc' | awk '{print $2}' | sudo xargs dpkg --purge


## Installing PHP 7.4 for local tools
## ----------------------------------
printf  "\n${RED}Installing PHP 7.4 for local tools${NC}\n"

sudo add-apt-repository ppa:ondrej/php
sudo apt install -y unzip
sudo apt install -y php7.4-cli php7.4-xml php7.4-mbstring php7.4-zip php7.4-mongodb php7.4-msgpack php7.4-igbinary php7.4-pdo php7.4-mysql php7.4-pgsql php7.4-xdebug php7.4-memcached
sudo apt autoremove
printf "${YELLOW}";php --version;printf "${NC}\n"
