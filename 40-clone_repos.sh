#!/bin/bash

source config.sh

## Create rpository directory
## --------------------------
printf  "\n${RED}Create rpository directory${NC}\n"
mkdir /home/$USER/html

## Cloning repos
## -------------
python3 /home/$USER/dev-system/python/repo_clone.py --from linna --type organization --dir /home/$USER/html

## Change owner and group
## ----------------------
printf  "\n${RED}Change owner and group${NC}\n"
sudo chown -R $USER /home/$USER/html
sudo chgrp -R $USER /home/$USER/html

ls -la /home/$USER/html/linna