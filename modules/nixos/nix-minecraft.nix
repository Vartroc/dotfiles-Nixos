{ inputs, config, lib, pkgs, ...}:
let
  modpack = pkgs.fetchPackwizModpack {
    url = "https://raw.githubusercontent.com/Vartroc/minimal-mods/main/pack.toml";
    packHash = "QSxjCPLejdm2HubXKdePl7xOk4eXsLI0YRbDetsKXR8=";
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
	servers.testing = {
		enable = true;
		autoStart = true;
    		package = pkgs.fabricServers.fabric-1_20_1.override { loaderVersion = "0.15.11"; };   		
		symlinks = {
      			"mods" = "${modpack}/mods";
		};
	};
};
}
