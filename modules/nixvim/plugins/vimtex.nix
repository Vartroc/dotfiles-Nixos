{ pkgs, ... }:
{
programs.nixvim = {
    plugins.vimtex = {
	enable = true;
	settings = {
	  view_method = "zathura";
	  compiler_method = "latexmk";
	};
    };
    extraConfigLua = ''
vim.g.vimtex_mainfile = 0
'';
};
environment.systemPackages = with pkgs; [
    zathura
    biber
    texliveFull
];
}
