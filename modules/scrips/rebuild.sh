#!/usr/bin/env bash

set -e

echo "This script will add everything in /etc/nixos/ to git, commit the changes and rebuild your system"
cd /etc/nixos/
sudo git add * 
read -rp "Enter git commit message: " message
sudo git -C /etc/nixos commit -m "$message" -a

read -rp "Enter host (default: Gartroc): " host

read -rp "Enter options to pass to the command (default: none): " options
echo -e "rebuilding... \n\n\n-------------------- ${host:-Gartroc} --------------------\n"
sudo nixos-rebuild switch --flake /etc/nixos/#"${host:-Gartroc}" $options

