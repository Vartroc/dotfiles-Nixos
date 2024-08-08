{ lib, config, pkgs, ... }:
let 
	gruvboxplus = import ./themes/gruvboxplus.nix { inherit pkgs; };
in
{
gtk = {
	enable = true;
	theme = {
		package = pkgs.adw-gtk3;
		name = "adw-gtk3";
	};
	iconTheme = {
		package = gruvboxplus;
		name = "GrubvoxPlus";
	};
};

qt = {	
	enable = true;
	platformTheme = "gtk";
	style = {
		name = "adwaita-dark";
#		package = pkgs.adwaita-qt;
	};
};
}
