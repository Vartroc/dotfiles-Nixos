{
description = "Nixos config flake";

inputs = {
	nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	home-manager = {
		url = "github:nix-community/home-manager";
		inputs.nixpkgs.follows = "nixpkgs";
	};

#	hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
	nix-minecraft.url = "github:Infinidoge/nix-minecraft";
#	niri.url = "github:sodiboo/niri-flake";
	stylix.url = "github:danth/stylix";
};

	


outputs = { self, nixpkgs, ... }@inputs: {
	nixosConfigurations.Gartroc = nixpkgs.lib.nixosSystem {
		specialArgs = {inherit inputs;};
		modules = [
        		./hosts/Gartroc/configuration.nix
        		inputs.home-manager.nixosModules.default
			{
            			home-manager.useGlobalPkgs = true;
            			home-manager.useUserPackages = true;
          		}
			inputs.stylix.nixosModules.stylix
#			inputs.niri.nixosModules.niri
		];
    	};
};

}
