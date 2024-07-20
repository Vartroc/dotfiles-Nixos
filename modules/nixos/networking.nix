{ config, lib, ... }:
{
options = {
	networking-custom.enable = mkEnableOption "Custom Networking Options";
};
config = lib.mkIf config.networking-custom.enable {
	networking.hostName = "Gartroc";
	networking.hostId = "afcefed7";
	networking.networkmanager.enable = true;
};
}
