{ config, ... }:
{
programs.nixvim = {
    options = {
	number = true;
	shiftwidth = 4;
	relativenumber = true;
	termguicolors = true;
    };
    
    clipboard = {
	register = "unnamedplus";
	providers.wl-copy.enable = true;
    };
    globals.mapleader = " ";
};
}