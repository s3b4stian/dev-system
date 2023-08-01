#!/bin/bash

source config.sh


## Update and Upgrade
## ------------------
printf  "\n${RED}Update and Upgrade${NC}\n"

sudo apt-get -y update
sudo apt-get -y upgrade


## Installing Docker and docker-compose
## ------------------------------------
printf  "\n${RED}Installing docker and docker-compose${NC}\n"

dpkg -l | grep docker | awk '{print $2}' | sudo xargs apt -y remove
dpkg -l | grep '^rc' | awk '{print $2}' | sudo xargs dpkg --purge

# Get official docker key
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Insert official docker repo
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Refresh
sudo apt update

# Install
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose

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
