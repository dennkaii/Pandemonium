{
  lib,
  config,
  ...
}: let
  cfg = config.desktops;
in {
  options.desktops.enable = lib.mkEnableOption "window managers, fcitx, etc";
  imports = [
    ./hyprland/hyprland.nix
    ./fcitx/fcitx.nix
    ./niri/niri.nix
    ./river/river.nix
  ];

  config.desktops = lib.mkIf cfg.enable {
    hyprland.enable = lib.mkDefault false;
    niri.enable = lib.mkDefault false;
    river.enable = lib.mkDefault false;
    fcitx.enable = lib.mkDefault false;
  };
}
