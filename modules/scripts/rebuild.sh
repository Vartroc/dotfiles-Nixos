#!/usr/bin/env bash

set -e
echo -e "This script will test your configuration, add everything in /etc/nixos/ to git, commit the changes and rebuild your system\n"
font="rozzo"

figlet -tc -f $font Testing... | lolcat
read -rp "Enter host (default: Gartroc): " host
read -rp "Enter options to pass to the command (default: none): " options
sudo nixos-rebuild test --flake /etc/nixos/#"${host:-Gartroc}" $options
echo -e "\n"

figlet -tc -f $font Committing... | lolcat
cd /etc/nixos/
sudo git add * 
read -rp "Enter git commit message: " message
sudo git -C /etc/nixos commit -m "$message" -a
echo -e "\n"

figlet -tc -f $font Applying... | lolcat
sudo nixos-rebuild switch --flake /etc/nixos/#"${host:-Gartroc}" $options

