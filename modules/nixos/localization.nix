{ config, lib, ... }:
{
options.localization.enable = lib.mkEnableOption "localization";

config = lib.mkIf config.localization.enable {
	time.timeZone = "Europe/Berlin";
	i18n.defaultLocale = "de_DE.UTF-8";
	console = {
		font = "Lat2-Terminus16";
		keyMap = "de";
	};

/*	services.xserver.xkb = {
		layout = "de";
	};*/
};
}
