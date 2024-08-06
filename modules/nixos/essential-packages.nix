{ pkgs, config, lib, inputs, ... }:
{
options = {
	essential-packages.enable = lib.mkEnableOption "essential-packages";
	
};
config = lib.mkIf config.essential-packages.enable {
	environment.systemPackages = with pkgs; [
		wget
		tmux
#		git
		grim
		slurp
		wl-clipboard
		swappy
		yazi
		zip
		unzip
		alsa-utils

		figlet
		lolcat
		firefox
		kitty
		alacritty
		rofi-wayland
	];
};
}
