{ pkgs, ... }:
{
programs.nixvim = {
    plugins.vimtex = {
	enable = true;
	settings.view_method = "zathura";
    };
    extraConfigLua = ''
vim.g.vimtex_mainfile = 0
'';
};
environment.systemPackages = with pkgs; [
    zathura
    biber
];
}
