{ config, inputs, lib, options, ... }:
{
let
	cfg = options.custom;
in

options.custom = { 
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
	lib.mkIf cfg.greetd.enable {
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
	lib.mkIf cfg.getty.enable {
		services.getty.autologinUser = "andi";
	};
}
