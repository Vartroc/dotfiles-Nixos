{ config, inputs, lib, pkgs, ... }:

{
imports = [
	./hardware-configuration.nix
#	../../modules/nixos/swww.nix
# 	inputs.home-manager.nixosModules.default
	../../modules/nixos/greetd.nix
	../../modules/nixos/boot.nix
	../../modules/nixos/networking.nix
	../../modules/nixos/localization.nix
	../../modules/nixos/bash.nix
	../../modules/nixos/nix-minecraft.nix
	../../modules/nixos/essential-packages.nix
	../../modules/nixos/sound.nix
	../../modules/nixos/bluetooth.nix
	../../modules/nixos/users.nix
	../../modules/nixos/gaming.nix
];
home-manager = {
	users = {
		"andi" = import ./home.nix;
	};
};

greetd.enable = false;
getty.enable = true;
bootloader = {
	grub.enable = true;
	zfs.enable = true;
};
networking-custom.enable = true;
localization.enable = true;
services.printing.enable = true;
bash.aliases.enable = true;
essential-packages.enable = true;
sound-module.enable = true;
bluetooth-module.enable = true;
andi.enable = true;
gaming.enable = true;
programs = {
	hyprland.enable = true;
	neovim.enable = true;
	mtr.enable = true;
	gnupg.agent.enable = true;
	kdeconnect.enable = true;
};

# Missalanious
nix.settings.experimental-features = [ "nix-command" "flakes" ];
nixpkgs.config.allowUnfree = true;
networking.firewall.enable = false;

environment.systemPackages = with pkgs; [
			
		waybar
		networkmanagerapplet
		swww
		mako
		libnotify
		wf-recorder

		firefox
		pavucontrol
		easyeffects
	
		bottles
		wine
		winetricks
		qemu
		speedtest-cli
		hyperfine
		btop

		dolphin
		libreoffice
		vlc
		yt-dlp
#		openshot-qt # --sip-4.19.25 not supported for interpreter python3.12--
		inkscape
		discord
#		niri
	];








# DO NOT CHANGE !!!
system.stateVersion = "24.05"; # Did you read the comment?

}
