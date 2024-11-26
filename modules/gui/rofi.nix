{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.gui.rofi;
  inherit (lib) mkIf mkEnableOption;
in {
  options.gui.rofi.enable = mkEnableOption "rofi";
  config = mkIf cfg.enable {
    hm = {
      programs.rofi = {
        enable = true;
        package = pkgs.rofi-wayland-unwrapped;
        location = "center";
      };
    };
  };
}
