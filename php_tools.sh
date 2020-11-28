#!/bin/bash

USER=sebastian
VER_CS_FIXER=v2.16.7
VER_INFECTION=0.20.2


## create directory and clean if already present
mkdir /home/$USER/html/bin
rm /home/$USER/html/bin/*


## Download PHP tools

### PHP cs Fixer
wget https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases/download/$VER_CS_FIXER/php-cs-fixer.phar -P /home/$USER/html/bin

### Composer
wget https://getcomposer.org/composer-stable.phar -P /home/$USER/html/bin

### PHPunit
wget https://phar.phpunit.de/phpunit.phar -P /home/$USER/html/bin

### Infection
wget https://github.com/infection/infection/releases/download/$VER_INFECTION/infection.phar -P /home/$USER/html/bin


## Make all executable
cd /home/$USER/html/bin

mv php-cs-fixer.phar php-cs-fixer
mv composer-stable.phar composer
mv phpunit.phar phpunit
mv infection.phar infection

chmod +x php-cs-fixer
chmod +x composer
chmod +x phpunit
chmod +x infection


## Copy update script
cd /home/$USER/
cp ./dev-system/php/update-all-tools.sh /home/$USER/html/bin/update-all-tools
cp ./dev-system/php/cs-fix-all.sh /home/$USER/html/bin/cs-fix-all
cp ./dev-system/php/repository.txt /home/$USER/html/bin/repository.txt
chmod +x /home/$USER/html/bin/update-all-tools
chmod +x /home/$USER/html/bin/cs-fix-all

## Copy all to sbin
sudo cp /home/$USER/html/bin/* /usr/local/sbin
