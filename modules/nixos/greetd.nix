{ pkgs, config, lib, ... }:

{
options = { 
	greetd = {
		enable = lib.mkEnableOption "greetd";
		command = lib.mkOption {
			type = str;
			default = "Hyprland";
		};
	};
	getty = {
		enable = lib.mkEnableOption "getty";
	};
};

config = {
	greetd = lib.mkIf config.greetd.enable {
		services.greetd = {
			enable = true;
			settings = rec {
				initial_session = {
					command = "${config.greetd.command}";
					user = "andi";
				};
				default_session = initial_session;
			};
		};
	};
	getty = lib.mkIf config.getty.enable {
		services.getty.autologinUser = "andi";
	};
};
}
