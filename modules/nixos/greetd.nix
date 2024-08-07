{ pkgs, config, inputs, lib, ... }:

{
options = { 
	greetd = {
		enable = lib.mkEnableOption "greetd";
		command = lib.mkOption {
			type = lib.types.str;
			default = "Hyprland";
		};
	};
	getty = {
		enable = lib.mkEnableOption "getty";
	};
};

config = lib.mkMerge
	[
		(lib.mkIf config.greetd.enable {
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
		})

		(lib.mkIf config.getty.enable {
			services.getty.autologinUser = "andi";
		})
	];
}
