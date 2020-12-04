#!/bin/bash

RED='\e[91m'
YELLOW='\e[93m'
NC='\e[0m'
export DEBIAN_FRONTEND=noninteractive

cd $HOME

## Installing Postgresql client
## ----------------------------
printf  "\n${RED}Installing Postgresql client${NC}\n"

curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
sudo apt install -y postgresql-client-12

printf "${YELLOW}";psql --version;printf "${NC}\n"


## Installing Mysql Client
## -----------------------
printf  "\n${RED}Installing Mysql Client${NC}\n"

sudo apt install -y mysql-client
printf "${YELLOW}";mysql --version;printf "${NC}\n"