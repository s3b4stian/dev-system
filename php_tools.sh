#!/bin/bash

USER=sebastian

## create directory and clean if already present
mkdir /home/$USER/html/bin
rm /home/$USER/html/bin/*

## Download PHP tools

### PHP cs Fixer
wget https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases/download/v2.16.1/php-cs-fixer.phar -P /home/$USER/html/bin

### Composer
wget https://getcomposer.org/composer-stable.phar -P /home/$USER/html/bin

### PHPunit
wget https://phar.phpunit.de/phpunit.phar -P /home/$USER/html/bin

### Infection
wget https://github.com/infection/infection/releases/download/0.15.3/infection.phar -P /home/$USER/html/bin

## Copy update script
cp ./php/update-all-tools.sh /home/$USER/html/bin/update-all-tools
chmod +x /home/$USER/html/bin/update-all-tools

## Copy all to sbin
sudo cp /home/$USER/html/bin/* /usr/local/sbin