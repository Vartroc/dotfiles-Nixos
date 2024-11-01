{ config, inputs, lib, ... }:
{
options = {
	bootloader = {
		grub = {
			enable = lib.mkEnableOption "grub-loader";
		};
		zfs = {
			enable = lib.mkEnableOption "zfs-support for bootloader";
		};
	};
};
config = lib.mkMerge [
	(lib.mkIf config.bootloader.grub.enable {
		boot.loader.grub = {
			enable = true;
			#useOSProber = true;
			efiSupport = true;
			efiInstallAsRemovable = true;
		};
	}
	)
	(lib.mkIf config.bootloader.zfs.enable {
		boot.loader.grub = {
			zfsSupport = true;
			mirroredBoots = [
				{ devices = [ "nodev" ]; path = "/boot"; }
			];
		};
	}
	)
];
}
