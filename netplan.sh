#!/bin/bash

## Configuring Netplan
sudo cp ./netplan/50-cloud-init.yaml /etc/netplan/50-cloud-init.yaml

sudo neplan apply