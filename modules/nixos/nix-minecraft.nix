{ inputs, config, lib, pkgs, ...}:
let
  modpack = pkgs.fetchPackwizModpack {
    url = "https://raw.githubusercontent.com/Vartroc/minimal-mods/61fc2ea1b54d3beb2dcab279bc945bed8d88c724/pack.toml";
    packHash = "IfjzxAdvBH1vXk+69iUC/S67mXQAJLkOCEyA6iWFxjw=";
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
	servers.final_2 = {
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
			text-file = pkgs.writeTextFile {
      				name = "ops.json";
      				text = "[ { \"uuid\": \"ce3a67ad-3a84-4bcb-a809-ad9d7330de01\", \"name\": \"Vartroc\", \"level\": 4 } ]";
    			};
		};
	};
};
}
