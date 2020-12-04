#!/bin/bash

export USER=sebastian
export DEBIAN_FRONTEND=noninteractive

cd $HOME

./10-prepare.sh
./20-local_php7.4.sh
./20-local_php8.0.sh
./30-local_database.sh
./40-clone_repos.sh
./50_php_tools.sh
./60-dev_env.sh
./70-netplan.sh
./70-samba.sh
