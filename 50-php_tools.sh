#!/bin/bash

RED='\e[91m'
YELLOW='\e[93m'
NC='\e[0m'
VER_CS_FIXER=v2.16.7
VER_INFECTION=0.20.2

## Create directory or clean if already present
## --------------------------------------------
printf "${RED}Create directory or clean if already present${NC}\n"

mkdir $HOME/html/bin
rm $HOME/html/bin/*


## Download PHP tools
## ------------------
printf "${RED}Download PHP tools${NC}\n"

### PHP cs Fixer
wget https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases/download/$VER_CS_FIXER/php-cs-fixer.phar -P $HOME/html/bin
### Composer
wget https://getcomposer.org/composer-stable.phar -P $HOME/html/bin
### PHPunit
wget https://phar.phpunit.de/phpunit.phar -P $HOME/html/bin
### Infection
wget https://github.com/infection/infection/releases/download/$VER_INFECTION/infection.phar -P $HOME/html/bin


## Make all executable
## -------------------
printf "${RED}Make all executable${NC}\n"

cd $HOME/html/bin

mv php-cs-fixer.phar php-cs-fixer
mv composer-stable.phar composer
mv phpunit.phar phpunit
mv infection.phar infection

chmod +x php-cs-fixer
chmod +x composer
chmod +x phpunit
chmod +x infection


## Copy scripts
## ------------
printf "${RED}Copy scripts${NC}\n"

cd $HOME
cp ./dev-system/php/update-all-tools.sh $HOME/html/bin/update-all-tools
cp ./dev-system/php/cs-fix-all.sh $HOME/html/bin/cs-fix-all
cp ./dev-system/php/repository.txt $HOME/html/bin/repository.txt
chmod +x $HOME/html/bin/update-all-tools
chmod +x $HOME/html/bin/cs-fix-all


## Copy all to sbin
## ----------------
printf "${RED}Copy all to sbin${NC}\n"

sudo cp $HOME/html/bin/* /usr/local/sbin

php-cs-fixer --version
composer --version
phpunit --version
infection --version