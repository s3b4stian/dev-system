#!/bin/bash

source config.sh

cd /home/$USER

## Cloning dev environment repository
## ----------------------------------
printf  "\n${RED}Cloning dev environment repository${NC}\n"

git clone https://github.com/s3b4stian/dev-compose.git


## Build Dockes containers
## -----------------------
printf  "\n${RED}Build Dockes containers${NC}\n"

cd dev-compose
sudo docker-compose build
sudo docker-compose up -d