{ pkgs, lib, config, ... }:

with lib;

let cfg = config.services.swww;
in {
  options.services.swww = {
    enable = mkEnableOption "Enable swww service";
    image = mkOption {
      type = types.str;
      description = "Path for swww img command";
      default = "${config.users.users.myUser.home}/Wallpapers/current.png";
    };
  };

  config = mkIf cfg.enable {
    systemd.user.services.swww = {
      description = "Start swww-daemon to handle wallpapers";
      wantedBy = [ "gaphical.target" ];

      restartIfChanged = true;

      serviceConfig = {
        Restart = "always";
        # DynamicUser = true;
        ExecStart = ''swww-daemon'';
      };
    };
  };

  meta.maintainers = with lib.maintainers; [ ];
}
