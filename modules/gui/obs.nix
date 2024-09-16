{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.gui.obs;
  inherit (lib) mkEnableOption mkIf;
in {
  options.gui.obs.enable = mkEnableOption "obs";

  config = mkIf cfg.enable {
    hm = {
      programs.obs-studio = {
        enable = true;
        plugins = with pkgs; [
          obs-studio-plugins.wlrobs
          obs-studio-plugins.obs-vkcapture
          obs-studio-plugins.obs-vaapi
        ];
      };
    };
  };
}
