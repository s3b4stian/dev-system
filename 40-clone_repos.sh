#!/bin/bash

RED='\e[91m'
YELLOW='\e[93m'
NC='\e[0m'
export DEBIAN_FRONTEND=noninteractive

cd $HOME

## Cloning repos
python3 ./dev-system/python/repo_clone.py --from linna --type organization --dir $HOME/html

## Change owner and group
sudo chown -R $USER $HOME/html
sudo chgrp -R $USER $HOME/html

ls -la $HOME/html