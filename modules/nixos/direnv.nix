{ pkgs, ... }: {
environment.systemPackages = with pkgs; [
  direnv
];
  programs.direnv = {
  #  package = pkgs.direnv;
    silent = false;
    loadInNixShell = true;
    direnvrcExtra = "";
    nix-direnv = {
      enable = true;
      package = pkgs.nix-direnv;
    };
  };
}
