{ inputs, config, lib, pkgs, ...}:
{
imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

environment.systemPackages = [
	pkgs.fabricServers.fabric-1_20_1
	pkgs.packwiz
];
services.minecraft-servers = {
	enable = true;
	eula = true;
	openFirewall = true;
	servers.hexagon = {
		enable = true;
		autoStart = true;
#		restart = "always";
		serverProperties = {
			white-list = true;
		};
	
    		package = pkgs.fabricServers.fabric-1_20_1.override { loaderVersion = "0.15.11"; };
    		symlinks = {
      			"mods" = "/home/andi/minecraft-hexamods/mods";
  		};

		whitelist = {
			Vartroc = "ce3a67ad-3a84-4bcb-a809-ad9d7330de01";
		};
		
	};
};
}
