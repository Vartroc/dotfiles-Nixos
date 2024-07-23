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
		package = pkgs.fabricServers.fabric-1_20_1;
		autoStart = true;
		restart = "always";
/*		serverProperties = {
			

		};
*/	
/*	symlinks = {
    mods = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
      BMC2 = fetchurl { url = "https://cdn.modrinth.com/data/shFhR8Vx/versions/SH0rTaJc/Better%20MC%20%5BFABRIC%5D%20-%20BMC2%20v25.mrpack"; sha512 = ""; };
      Lithium = fetchurl { url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/ZSNsJrPI/lithium-fabric-mc1.20.1-0.11.2.jar"; sha512 = "d1b5c90ba8b4879814df7fbf6e67412febbb2870e8131858c211130e9b5546e86b213b768b912fc7a2efa37831ad91caf28d6d71ba972274618ffd59937e5d0d"; };

	};
};
*/
	
		
	};
};
}
