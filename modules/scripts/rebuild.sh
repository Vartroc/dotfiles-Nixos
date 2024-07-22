#!/usr/bin/env bash

set -e
echo "This script will add everything in /etc/nixos/ to git, commit the changes and rebuild your system"


echo -e "\n\n--------------- Testing Weather the configuration will build --------------"
read -rp "Enter host (default: Gartroc): " host_test
read -rp "Enter options to pass to the command (default: none): " options_test
sudo nixos-rebuild test --flake /etc/nixos/#"${host_test}" $options_test

echo -e "\n\n-------------------- Git Commmit --------------------\n"
cd /etc/nixos/
sudo git add * 
read -rp "Enter git commit message: " message
sudo git -C /etc/nixos commit -m "$message" -a

read -rp "Enter host (default: Gartroc): " host

read -rp "Enter options to pass to the command (default: none): " options


echo -e "rebuilding... \n\n--------------------Appliing changes on  ${host:-Gartroc} --------------------\n"
sudo nixos-rebuild switch --flake /etc/nixos/#"${host:-Gartroc}" $options

