{ lib, input, pkgs, config, ... }:
{
environment.systemPackages = [
	pkgs.catppuccin
];
home-manager.users."andi" = {
	gtk = {
    		enable = true;
    		theme = {
        		package = pkgs.catppuccin;
        		name = "Catppuccin-Mocha";
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
        		name = "Catppuccin-Mocha";
        		package = pkgs.catppuccin;
    		};
	};
};
}
