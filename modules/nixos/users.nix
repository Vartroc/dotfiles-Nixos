{ lib, config, ... }:
{
options = {
	andi.enable = lib.mkEnableOption "the andi user";
};
config = lib.mkIf config.andi.enable {
	users.users.andi = {
  		isNormalUser = true;
  		extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
		initialPassword = "password";	
  	};
};
}
