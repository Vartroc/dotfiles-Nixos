{ lib, config, ... }:
{
options = {
	bluetooth-module.enable = lib.mkEnableOption "Bluetooth support";
};
config = lib.mkIf config.bluetooth-module.enable {
	hardware.bluetooth.enable = true; # enables support for Bluetooth
  	hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  	services.blueman.enable = true;
};
}
