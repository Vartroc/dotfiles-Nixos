{ inputs, config, lib, pkgs, ...}:
let
  modpack = pkgs.fetchPackwizModpack {
    url = "https://raw.githubusercontent.com/Vartroc/hexagonmods/main/pack.toml";
    packHash = "yCOCXEsOs8yZaNni8GA/OgBEtovhrah+g/yHUd4Yc4s=";
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
