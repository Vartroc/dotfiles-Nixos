{ pkgs, ... }:

{
imports = [
	./hardware-configuration.nix
	../../modules/nixos/greetd.nix
	../../modules/nixos/boot.nix
	../../modules/nixos/networking.nix
	../../modules/nixos/localization.nix
	../../modules/nixos/nix-minecraft.nix
	../../modules/nixos/essential-packages.nix
	../../modules/nixos/sound.nix
	../../modules/nixos/bluetooth.nix
	../../modules/nixos/users.nix
	../../modules/nixos/gaming.nix
	../../modules/home-manager/theming.nix
	../../modules/home-manager/river.nix
	../../modules/nixos/fonts.nix
	../../modules/nixos/neovim.nix
	../../modules/nixvim/nixvim.nix
	../../modules/nixos/ollama.nix
	../../modules/nixos/direnv.nix
	../../modules/home-manager/zsh.nix
];
home-manager = {
	users = {
		"andi" = import ./home.nix;
	};
};

greetd.enable = true;
greetd.command = "river";
getty.enable = true;
bootloader = {
	grub.enable = true;
	zfs.enable = true;
};
networking-custom.enable = true;
localization.enable = true;
services.printing.enable = true;
essential-packages.enable = true;
sound-module.enable = true;
bluetooth-module.enable = true;
andi.enable = true;
gaming.enable = true;
programs = {
	hyprland.enable = false;
	mtr.enable = true;
	gnupg.agent.enable = true;
	kdeconnect.enable = true;
};

# Missalanious
security.polkit.enable = true;
services.fwupd.enable = true;
programs.dconf.enable = true;
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
		signal-desktop
		pavucontrol
#		easyeffects
	
		bottles
		wine
		winetricks
		qemu
		speedtest-cli
		hyperfine
		btop

#		dolphin
		libreoffice
		vlc
		yt-dlp
		inkscape
		mpv
		obsidian
		vesktop

		gimp
		uwuify		
		arc-theme
		qt6ct
		papirus-icon-theme
		adwaita-qt
		anki
		python312Packages.pyqt6
		texliveFull
	];



# DO NOT CHANGE !!!
system.stateVersion = "24.05"; # Did you read the comment?

}
