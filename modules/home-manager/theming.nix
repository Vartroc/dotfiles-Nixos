{ lib, config, pkgs, ... }:
{
gtk.enable = false;



qt = {	
	enable = true;
	platformTheme = "gtk";
	style = {
		name = "adwaita-dark";
#		package = pkgs.adwaita-qt;
	};
};
}
