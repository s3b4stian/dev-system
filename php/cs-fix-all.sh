#!/bin/bash

USER=sebastian

RED='\033[1;31m'
NC='\033[0m' # No Color

cd /home/$USER/html

repos=($(sed ':a;N;$!ba;s/\n/ /g' /home/sebastian/html/bin/repository.txt))

for r in "${repos[@]}"
do
   printf "${RED}$r${NC}\n"
   php-cs-fixer fix /home/sebastian/html/$r --rules=@PSR2,no_whitespace_in_blank_line,return_type_declaration,native_function_invocation --allow-risky=yes
   printf "\n\n"
done
