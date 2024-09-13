{ lib, pkgs, config, ... }:
{
/*programs.neovim = {
	enable = true;
	defaultEditor = true;
};*/
environment.systemPackages = with pkgs; [
	ripgrep
	gcc
	tree-sitter
	fd
	python3
	gnumake
	luarocks-nix
];
}
