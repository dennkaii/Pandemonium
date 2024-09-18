{
  config,
  lib,
  ...
}: let
  cfg = config.services.hypridle;
  inherit (lib) mkEnableOption mkIf;
in {
  options.services.hypridle.enable = mkEnableOption "hypridle";

  config = mkIf cfg.enable {
    hm.services.hypridle = {
      enable = true;
      settings = {
        lockCmd = "pidof hyprlock || hyprlock";
        # afterSleepCmd = "hyprctl dispatch dpms on";
        beforeSleepCmd = "loginctl lock-session";

        listeners = [
          {
            timeout = 500;
            onTimeout = "loginctl lock-session";
          }
          # {
          #   timeout = 530;
          #   onTimeout = "hyprctl dispatch dpms off";
          #   onResume = "hyprctl dispatch dpms on ";
          # }
          {
            timeout = 1800;
            onTimeout = "systemctl suspend";
          }
        ];
      };
    };
  };
}
