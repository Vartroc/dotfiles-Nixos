{ lib, config, pkgs, ... }:
let 
	gruvboxplus = import ./themes/gruvboxplus.nix { inherit pkgs; };
in
{
/*
home.packages = with pkgs; [
	arc-theme
	kvantum
	qt5ct
	papirus-icon-theme
	breeze-cursors
];

environment.variables = [
	"GTK_THEME" = "Ark-Dark";
	GTK_ICON_THEME = "Papirus";
	XCURSOR_THEME = "Breeze";

	QT_QPA_PLATFORMTHEME = "qt5ct";
	QT_STYLE_OVERRIDE = "kvantum";

	XDG_SESSION_TYPE = "wayland";
	XDG_CURRENT_DESKTOP = "river";
	MOZ_ENABBLE_WAYLAND = "1";
];

*/
/*gtk = {
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
};*/
}
