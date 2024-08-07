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

greetd.enable = false;
getty.enable = true;
bootloader = {
	grub.enable = true;
	zfs.enable = true;
};
networking-custom.enable = true;
localization.enable = true;
programs.hyprland.enable = true;
#  programs.niri.enable = true;
services.printing.enable = true;
bash.aliases.enable = true;
essential-packages.enable = true;
sound-module.enable = true;
bluetooth-module.enable = true;
andi.enable = true;
gaming.enable = true;


programs.neovim.enable = true;


	# Missalanious
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	nixpkgs.config.allowUnfree = true;
	programs.kdeconnect.enable = true;

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









  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.

  home-manager = {
  	users = {
		"andi" = import ./home.nix;
	};
  };


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
  	enable = true;
};


# ---------------Stylix-------------------#

stylix = {
	enable = false;
	image = /home/andi/Wallpapers/current.png;
	autoEnable = true;
};
  #enableSSHSupport = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
#	networking.firewall.allowedTCPPorts = [ 25565 ];
#	networking.firewall.allowedUDPPorts = [ 34197 ];
  # Or disable the firewall altogether.
 networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}
