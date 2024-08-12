{ lib, input, pkgs, config, ... }:
{
environment.systemPackages = [
	pkgs.catppuccin
	pkgs.arc-theme
];
home-manager.users."andi" = {
	gtk = {
    		enable = true;
    		theme = {
        		package = pkgs.arc-theme;
        		name = "Arc-Dark";
		};/*
    		iconTheme = {
        		package = gruvboxplus;
       		 	name = "GrubvoxPlus";
    		};*/
	};

	qt = {    
    		enable = true;
    		platformTheme.name = "gtk";
    		style = {
        		name = "Catppuccin";
        		package = pkgs.catppuccin;
    		};
	};
};
}
