{ inputs, config, lib, pkgs, ... }:
{
	programs.git = {
		enable = true;
		userName = "Vartroc";
		userEmail = "andi@thurau.net";
		extraConfig = {
			init.defaultBranch = "main";
		};
	};
}
