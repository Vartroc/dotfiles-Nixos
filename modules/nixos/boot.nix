{ config, inputs, lib, ... }:
{
options = {
	bootloader = {
		grub = {
			enable = lib.mkEnableOption "grub-loader";
		};
		zfs = {
			enable = lib.mkEnableOpiton "zfs-support for bootloader";
		};
	};
};
config = lib.mkIf config.bootloader.grub {
	boot = {
		loader = {
			grub = {
				enable = true;
				useOSProber = true;
				efiSupport = true;
				efiInstallAsRemovable = true;
				lib.mkIf config.bootloader.zfs.enable {
					zfsSupport = true;
					mirroredBoots = [
						{ devices = [ "nodev" ]; path = "/boot"; }
					];
				};
			};
		};
	};
};
}
