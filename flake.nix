{
description = "Nixos config flake";

inputs = {
	nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

	home-manager = {
	url = "github:nix-community/home-manager";
	inputs.nixpkgs.follows = "nixpkgs";
	};

	nix-minecraft.url = "github:Infinidoge/nix-minecraft";

	stylix.url = "github:danth/stylix";
};

	


outputs = { self, nixpkgs, ... }@inputs: {
	nixosConfigurations.default = nixpkgs.lib.nixosSystem {
		specialArgs = {inherit inputs;};
		modules = [
        		./hosts/Gartroc/configuration.nix
        		inputs.home-manager.nixosModules.default
			inputs.stylix.nixosModules.stylix
		];
    	};
};

}
