{ config, ... }:
{
programs.nixvim = {
    options = {
	number = true;
	shiftwidth = 4;
	relativenumber = true;
	termguicolors = true;
    };
    
    clipboard.register = "unnamedplus";
    globals.mapleader = " ";
};
}
