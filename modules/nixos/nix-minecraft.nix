{ inputs, config, lib, pkgs, ...}:
let
  modpack = pkgs.fetchPackwizModpack {
    url = "https://raw.githubusercontent.com/Vartroc/minimal-mods/not_broken/pack.toml";
    packHash = "jtyEm6kZT3SYPBHFn0yQ+979DHGmeLHUsTeCGs1qwjU=";
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
	servers.hexagonal_planar_4 = {
/*		serverProperties = {
			white-list = true;
		};*/
		enable = true;
		autoStart = true;
/*		whitelist = { 
			Vartroc = "ce3a67ad-3a84-4bcb-a809-ad9d7330de01";
			kathu05 = "8c3c5600-2f7e-49f9-9590-c2d43abfe467";
			rreeper = "22d62250-fe23-4894-8006-0a23a0529631";
		};*/
    		package = pkgs.fabricServers.fabric-1_20_1.override { loaderVersion = "0.15.11"; };   		
		symlinks = {
      			"mods" = "${modpack}/mods";
			"ops.json" = pkgs.writeTextFile {
      				name = "ops.json";
      				text = "[ { \"uuid\": \"ce3a67ad-3a84-4bcb-a809-ad9d7330de01\", \"name\": \"Vartroc\", \"level\": 4 } ]";
    			};
		};
	};
};
}
