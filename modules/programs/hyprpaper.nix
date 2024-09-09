{
  config,
  lib,
  inputs,
  ...
}: let
  cfg = config.programs.hyprpaper;
  inherit (lib) mkEnableOption mkIf;
in {
  options = {
    programs.hyprpaper.enable = mkEnableOption "hyprpaper";
  };

  config = mkIf cfg.enable {
    inputs.hyprpaper.url = "github:hyprwm/hyprpaper";

    # hmModules = [inputs.hyprpaper.homeManagerModules.default];

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
