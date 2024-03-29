#!/bin/bash

source config.sh

#VER_CS_FIXER=v3.23.0
#VER_INFECTION=0.27.0

## Create directory or clean if already present
## --------------------------------------------
printf "${RED}Create directory or clean if already present${NC}\n"

mkdir /home/$USER/html/bin
rm /home/$USER/html/bin/*


## Download PHP tools
## ------------------
printf "${RED}Download PHP tools${NC}\n"

### PHP cs Fixer
#wget https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases/download/$VER_CS_FIXER/php-cs-fixer.phar -P /home/$USER/html/bin
curl -sL https://api.github.com/repos/FriendsOfPHP/PHP-CS-Fixer/releases/latest | grep "php-cs-fixer.phar" | cut -d : -f 2,3 | tr -d \" | head -n 2 | tail -n 1 | wget -i - -P /home/$USER/html/bin
### Composer
wget https://getcomposer.org/composer-stable.phar -P /home/$USER/html/bin
### PHPunit
wget https://phar.phpunit.de/phpunit.phar -P /home/$USER/html/bin
### Infection
#wget https://github.com/infection/infection/releases/download/$VER_INFECTION/infection.phar -P /home/$USER/html/bin
curl -sL https://api.github.com/repos/infection/infection/releases/latest | grep "infection.phar" | cut -d : -f 2,3 | tr -d \" | head -n 2 | tail -n 1 | wget -i - -P /home/$USER/html/bin
### PHP Documentor
wget https://phpdoc.org/phpDocumentor.phar -P /home/$USER/html/bin


## Make all executable
## -------------------
printf "${RED}Make all executable${NC}\n"

cd /home/$USER/html/bin

mv php-cs-fixer.phar php-cs-fixer
mv composer-stable.phar composer
mv phpunit.phar phpunit
mv infection.phar infection
mv phpDocumentor.phar php-doc.phar

chmod +x php-cs-fixer
chmod +x composer
chmod +x phpunit
chmod +x infection
chmod +x php-doc.phar

## Copy scripts
## ------------
printf "${RED}Copy scripts${NC}\n"

cp /home/$USER/dev-system/php/update-all-tools.sh /home/$USER/html/bin/update-all-tools
cp /home/$USER/dev-system/php/cs-fix-all.sh /home/$USER/html/bin/cs-fix-all
cp /home/$USER/dev-system/php/repository.txt /home/$USER/html/bin/repository.txt
chmod +x /home/$USER/html/bin/update-all-tools
chmod +x /home/$USER/html/bin/cs-fix-all

# make link to permit the compressed phar to work
sudo ln -s php-doc.phar php-doc

## Copy all to sbin
## ----------------
printf "${RED}Copy all to sbin${NC}\n"

sudo cp /home/$USER/html/bin/* /usr/local/sbin

php-cs-fixer --version
composer --version
phpunit --version
infection --version
php-doc --version
