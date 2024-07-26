{ inputs, config, lib, pkgs, ...}:
let
  modpack = pkgs.fetchPackwizModpack {
    url = "https://raw.githubusercontent.com/Vartroc/hexagon-server/main/pack.toml";
    packHash = "Qegsq6yJs7QDB2IQqv4/34G1Trnw30t8nvaUDC8CqTw=";
  };
in
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
    		package = pkgs.fabricServers.fabric-1_20_1.override { loaderVersion = "0.15.11"; };   		
		symlinks = {
      			"mods" = "${modpack}/mods";
		};
	};
};
}
