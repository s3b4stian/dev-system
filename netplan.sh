#!/bin/bash

cd /home/$USER/

## Configuring Netplan
sudo cp ./dev-system/netplan/50-cloud-init.yaml /etc/netplan/50-cloud-init.yaml

sudo neplan apply