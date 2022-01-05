#!/bin/bash

source config.sh


## Remove other versions of PHP
## ----------------------------
printf  "\n${RED}Remove other versions of PHP${NC}\n"

dpkg -l | grep php | awk '{print $2}' | sudo xargs apt -y remove
dpkg -l | grep '^rc' | awk '{print $2}' | sudo xargs dpkg --purge


## Installing PHP 8.1 for local tools
## ----------------------------------
printf  "\n${RED}Installing PHP 8.1 for local tools${NC}\n"

sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get install -y unzip
sudo apt-get install -y php8.1-cli php8.1-xml php8.1-mbstring php8.1-zip php8.1-msgpack php8.1-igbinary php8.1-pdo php8.1-mysql php8.1-pgsql php8.1-xdebug php8.1-memcached php8.1-mongodb php8.1-curl
sudo apt-get autoremove


## Configuring Xdebug for php-cli
## ------------------------------
printf  "\n${RED}Configuring Xdebug for php-cli${NC}\n"

#sudo echo "zend_extension=xdebug.so" > /etc/php/8.1/mods-available/xdebug.ini
#sudo ln -s /etc/php/8.1/mods-available/xdebug.ini /etc/php/8.1/cli/conf.d/20-xdebug.ini
printf "${YELLOW}";php --version;printf "${NC}\n"
