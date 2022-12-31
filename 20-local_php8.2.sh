#!/bin/bash

source config.sh


## Remove other versions of PHP
## ----------------------------
printf  "\n${RED}Remove other versions of PHP${NC}\n"

dpkg -l | grep php | awk '{print $2}' | sudo xargs apt -y remove
dpkg -l | grep '^rc' | awk '{print $2}' | sudo xargs dpkg --purge


## Installing PHP 8.2 for local tools
## ----------------------------------
printf  "\n${RED}Installing PHP 8.2 for local tools${NC}\n"

sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get install -y unzip
sudo apt-get install -y php8.2-cli php8.2-xml php8.2-mbstring php8.2-zip php8.2-msgpack php8.2-igbinary php8.2-pdo php8.2-mysql php8.2-pgsql php8.2-xdebug php8.2-memcached php8.2-mongodb php8.2-curl
sudo apt-get autoremove


## Configuring Xdebug for php-cli
## ------------------------------
printf  "\n${RED}Configuring Xdebug for php-cli${NC}\n"

#sudo echo "zend_extension=xdebug.so" > /etc/php/8.2/mods-available/xdebug.ini
#sudo ln -s /etc/php/8.2/mods-available/xdebug.ini /etc/php/8.2/cli/conf.d/20-xdebug.ini
printf "${YELLOW}";php --version;printf "${NC}\n"
