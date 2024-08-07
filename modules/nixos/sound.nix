{ lib, config, ... }:
{
options = {
	sound-module.enable = lib.mkEnableOption "sound-support";
};
config = lib.mkIf config.sound-module.enable {
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		jack.enable = true;
	};
};
}
