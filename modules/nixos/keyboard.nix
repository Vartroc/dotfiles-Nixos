{ lib, pkgs, config, ... }:
let 
fetched_layout = lib.fetchurl {
   url = "https://dl.neo-layout.org/mine";
   hash = "";
};
in
let
  compiledLayout = pkgs.runCommand "keyboard-layout" {} ''
    ${pkgs.xorg.xkbcomp}/bin/xkbcomp ${fetched_layout} $out
  '';
in
{
  environment.systemPackages = [ pkgs.xorg.xkbcomp ];
  services.xserver.displayManager.sessionCommands = "${pkgs.xorg.xkbcomp}/bin/xkbcomp ${compiledLayout} $DISPLAY";
  home-manager.users."andi" = {
   home.keyboard = null;   
  };
}
