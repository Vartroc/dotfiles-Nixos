{ pkgs, config, lib, inputs, ... }:
{
options = {
	essential-packages.enable = lib.mkEnableOption "essential-packages";
	
};
config = lib.mkIf config.essential-packages.enable {
	environment.systemPackages = with pkgs; [
		wget
		tmux
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
		alacritty
#		rofi-wayland
	];
};
}
