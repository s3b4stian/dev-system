#!/bin/bash

source config.sh


## Remove other versions of PHP
## ----------------------------
printf  "\n${RED}Remove other versions of PHP${NC}\n"

dpkg -l | grep php | awk '{print $2}' | sudo xargs apt -y remove
dpkg -l | grep '^rc' | awk '{print $2}' | sudo xargs dpkg --purge


## Installing PHP 8.1
## ------------------
printf  "\n${RED}Installing PHP 8.1${NC}\n"

sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get install -y unzip
sudo apt-get install -y php8.1 php8.1-fpm php8.1-dev php8.1-common php8.1-cli php8.1-xml php8.1-mbstring php8.1-zip php8.1-msgpack php8.1-igbinary php8.1-pdo php8.1-mysql php8.1-pgsql php8.1-xdebug php8.1-memcached php8.1-mongodb php8.1-curl
sudo apt-get autoremove

## Installing Apache
## -----------------
printf  "\n${RED}Installing Apache${NC}\n"

sudo apt-get install -y apache2

## Configuring Apache
## ------------------
printf  "\n${RED}Configuring Apache${NC}\n"

# Enable Apache modules
sudo a2enmod actions alias proxy_fcgi rewrite ssl
# Disable default sites
sudo a2dissite 000-default default-ssl

# Remove default sites configuraiton
sudo rm /etc/apache2/sites-available/*

# Copy Apache and PHP configuration files
sudo cp ./apache/www.conf /etc/php/8.1/fpm/pool.d/www.conf
sudo cp ./apache/php-fpm.conf /etc/apache2/conf-enabled/php-fpm.conf
sudo cp ./apache/site.conf /etc/apache2/sites-available/site.conf
sudo cp ./apache/site_ssl.conf /etc/apache2/sites-available/site_ssl.conf

# Enable new sites
sudo a2ensite site site_ssl

# Generate new ssl certs
openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 -subj 	\
   "/C=US/CN=localhost" 					\
    -keyout /tmp/ssl.key -out /tmp/ssl.crt 			\

ls -la /tmp/ssl*

# Copy ssl certs to destination folder
sudo mkdir -p /etc/apache2/ssl
sudo cp /tmp/ssl.key /etc/apache2/ssl
sudo cp /tmp/ssl.crt /etc/apache2/ssl

# Restart Services
sudo systemctl restart apache2
sudo systemctl restart php8.1-fpm

## Configuring Xdebug for php-cli
## ------------------------------
printf  "\n${RED}Configuring Xdebug for php-cli${NC}\n"

#sudo echo "zend_extension=xdebug.so" > /etc/php/8.1/mods-available/xdebug.ini
#sudo ln -s /etc/php/8.1/mods-available/xdebug.ini /etc/php/8.1/cli/conf.d/20-xdebug.ini
printf "${YELLOW}";php --version;printf "${NC}\n"
