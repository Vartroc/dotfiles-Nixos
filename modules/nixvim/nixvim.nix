{ pkgs, inputs, config, ... }:
{
imports = [
	./plugins/default.nix
];

programs.nixvim = {
	enable = true;
	colorschemes.catppuccin = {
		enable = true;
		flavour = "mocha";
	};
};
}
