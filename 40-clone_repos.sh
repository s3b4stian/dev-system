#!/bin/bash

source config.sh


## Cloning repos
python3 cd /home/$USER/dev-system/python/repo_clone.py --from linna --type organization --dir /home/$USER/html

## Change owner and group
sudo chown -R $USER /home/$USER/html
sudo chgrp -R $USER /home/$USER/html

ls -la /home/$USER/html