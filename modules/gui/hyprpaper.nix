{
  config,
  lib,
  ...
}: let
  cfg = config.gui.hyprpaper;
  inherit (lib) mkEnableOption mkIf;
in {
  options = {
    programs.gui.hyprpaper.enable = mkEnableOption "hyprpaper";
  };

  config = mkIf cfg.enable {
    hm.services.hyprpaper = {
      enable = true;

      settings = {
        wallpaper = [
          "eDP-1,${config.defaults.wallpaper}"
        ];
        preload = [
          "${config.defaults.wallpaper}"
        ];
      };
    };
  };
}
