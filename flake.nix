{
description = "Nixos config flake";

inputs = {
	nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	home-manager = {
		url = "github:nix-community/home-manager";
		inputs.nixpkgs.follows = "nixpkgs";
	};
	catppuccin.url = "github:catppuccin/nix";
	nixvim = {
    		url = "github:nix-community/nixvim";
    		inputs.nixpkgs.follows = "nixpkgs";
  	};
	nix-minecraft.url = "github:Infinidoge/nix-minecraft";
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
			inputs.catppuccin.nixosModules.catppuccin
			inputs.nixvim.nixosModules.nixvim
		];
	};	
	nixosConfigurations.Sartroc = nixpkgs.lib.nixosSystem {
		specialArgs = {inherit inputs;};
		modules = [
        		./hosts/Sartroc/configuration.nix
        		inputs.home-manager.nixosModules.default
			{
            			home-manager.useGlobalPkgs = true;
            			home-manager.useUserPackages = true;
          		}
			inputs.stylix.nixosModules.stylix
#			inputs.nixvim.homeManagerModules.nixvim
    		];	
	};
};

}
