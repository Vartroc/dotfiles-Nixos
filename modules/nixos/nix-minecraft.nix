{ inputs, config, lib, pkgs, ...}:
{
imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

environment.systemPackages = [
	fabricServers.fabric-1_19_2
];
services.minecraft-servers = {
	enable = true;
	eula = true;
	openFirewall = true;
	servers.hexagon = {
		enable = true;
		package = pkgs.fabricServers.fabric-1_19_2;
		autoStart = true;
		restart = true;
/*		serverProperties = {
			

		};
*/		
	};
};
}
