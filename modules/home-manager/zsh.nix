{ config, pkgs, ... }:
{
users.defaultUserShell = pkgs.zsh;
environment.shells = with pkgs; [ zsh ];
programs.zsh.enable = true;

home-manager.users."andi" = {

programs.zsh = {
  		enable = true;
  		enableCompletion = true;
  		autosuggestion.enable = true;
  		syntaxHighlighting.enable = true;

		shellAliases = {
			config = "cd /etc/nixos/hosts/Gartroc/ && nvim .";
			flake = "cd /etc/nixos/ && sudo nvim flake.nix";

			rb = "/etc/nixos/modules/scripts/rebuild.sh" ;
  		};
  		history = {
    			size = 10000;
#    			path = "${config.home.homeDirectory}/.config/zsh/history";
  		};
		
		oh-my-zsh = {
			enable = true;
			plugins = [ "git" "direnv" ];
		};
	};
};
}
