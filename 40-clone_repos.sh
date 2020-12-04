#!/bin/bash

source config.sh

cd $HOME

## Cloning repos
python3 ./dev-system/python/repo_clone.py --from linna --type organization --dir $HOME/html

## Change owner and group
sudo chown -R $USER $HOME/html
sudo chgrp -R $USER $HOME/html

ls -la $HOME/html