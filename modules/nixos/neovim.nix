{ lib, pkgs, config, ... }:
{
programs.neovim = {
	enable = true;
	defaultEditor = true;
};
environment.systemPackages = with pkgs; [
	ripgrep
	gcc

];
}
