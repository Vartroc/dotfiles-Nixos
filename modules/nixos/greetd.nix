{ pkgs, config, lib, ... }:

let
	cfg = options.custom;
in
{
options = { 
	greetd = {
		enable = lib.mkEnableOption "greetd";
		command = lib.mkOption {
			type = types.str;
			default = "Hyprland";
		};
	};
	getty = {
		enable = lib.mkEnableOption "getty";
	};
};

config = {
	greetd = lib.mkIf cfg.greetd.enable {
		services.greetd = {
			enable = true;
			settings = rec {
				initial_session = {
					command = "${cfg.greetd.command}";
					user = "andi";
				};
				default_session = initial_session;
			};
		}
	};
	getty = lib.mkIf cfg.getty.enable = {
		services.getty.autologinUser = "andi";
	};
}
