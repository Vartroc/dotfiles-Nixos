{ pkgs, ... }:
{
programs.nixvim = {
    plugins.vimtex = {
	enable = true;
	settings.view_method = "zathura";
    };
};
environment.systemPackages = with pkgs; [
    zathura
    biber
];
}
