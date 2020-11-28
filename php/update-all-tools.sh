#!/bin/bash

USER=sebastian
VER_INFECTION=0.20.2

cd /home/$USER/html/bin

# Update composer
sudo ./composer selfupdate -vvv

# Update phpunit
sudo ./phpunit --check-version
sudo rm phpunit
sudo wget https://phar.phpunit.de/phpunit.phar
sudo chmod +x phpunit.phar
sudo mv phpunit.phar phpunit
sudo ./phpunit --check-version

# Update php-cs-fixer
sudo ./php-cs-fixer selfupdate

# Update infection
sudo rm infection
sudo wget https://github.com/infection/infection/releases/download/$VER_INFECTION/infection.phar
sudo chmod +x infection.phar
sudo mv infection.phar infection
sudo ./infection --version

# Copy all to sbin
sudo cp * /usr/local/sbin
