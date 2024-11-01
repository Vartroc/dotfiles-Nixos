{ inputs, pkgs, ... }:
{
environment.variables = {
      GDK_BACKEND = "wayland";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";

      QT_QPA_PLATFORM = "wayland";
      QT_QPA_PLATFORMTHEME = "qt6ct";
      QT_STYLE_OVERRIDE = "kvantum";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

      XDG_CURRENT_DESKTOP = "river";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "river";
};
home-manager.users."andi" = {
  imports = [ inputs.catppuccin.homeManagerModules.catppuccin ];
  catppuccin = {
    enable = true;
    flavor = "mocha";
#    accent = "lavender";
    pointerCursor.enable = false;
  };
  home.pointerCursor = {
    gtk.enable = true;
#    name = "Bibata-Modern-Classic";
    name = "Banana-Curser";
    size = 20;
#    package = pkgs.bibata-cursors;
    package = pkgs.banana-cursor;
  };

/*  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "kvantum";
  };*/

  gtk = {
    enable = true;
    catppuccin = {
      enable = true;
      icon.enable = true;
    };
  };
};
}
