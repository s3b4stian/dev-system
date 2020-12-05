#!/bin/bash

source config.sh


## Update and Upgrade
## ------------------
printf  "\n${RED}Update and Upgrade${NC}\n"

sudo apt-get -y update
sudo apt-get -y upgrade


## Installing Docker and docker-compose
## ------------------------------------
printf  "\n${RED}Installing Docker and docker-compose${NC}\n"

sudo apt-get -y install docker docker.io docker-compose
printf "${YELLOW}";docker --version;printf "${NC}\n"


## Installing Git
## --------------
printf "\n${RED}Installing Git${NC}\n"

sudo apt-get -y install git
printf "${YELLOW}";git --version;printf "${NC}\n"


## Installing python3 dependencies
## -------------------------------
printf  "\n${RED}Installing python3 dependencies${NC}\n"

sudo apt-get -y install python3-pip
pip3 install argcomplete
pip3 install gitpython
printf "${YELLOW}";python3 --version;printf "${NC}\n"