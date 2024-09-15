{
  lib,
  config,
  ...
}: let
  cfg = config.desktops;
in {
  options.desktops.enable = lib.mkEnableOption "window managers, fcitx, etc";

  config.desktops = lib.mkIf cfg.enable {
    hyprland.enable = lib.mkDefault false;
    niri.enable = lib.mkDefault false;
    river.enable = lib.mkDefault false;
    fcitx.enable = lib.mkDefault false;
  };
}
