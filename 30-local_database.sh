#!/bin/bash

source config.sh


## Installing Postgresql client
## ----------------------------
printf  "\n${RED}Installing Postgresql client${NC}\n"

curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/apt.postgresql.org.gpg >/dev/null
sudo sh -c 'echo "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
sudo apt-get install -y postgresql-client-12

printf "${YELLOW}";psql --version;printf "${NC}\n"


## Installing Mysql Client
## -----------------------
printf  "\n${RED}Installing Mysql Client${NC}\n"

sudo apt-get install -y mysql-client
printf "${YELLOW}";mysql --version;printf "${NC}\n"