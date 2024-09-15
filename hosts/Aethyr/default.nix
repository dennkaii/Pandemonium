{
  pkgs,
  lib,
  ...
}: {
  imports = [./hardware];

  users = {
    main = "dennkaii";
    host = "Aethyr";
  };

  defaults = {
    terminal = "wezterm";
    cursor = {
      name = "Breeze_Snow";
      size = 24;
      pkg = pkgs.kdePackages.breeze;
    };
  };

  desktops = {
    river.enable = lib.mkDefault false;
    hyprland.enable = lib.mkDefault false;
    fcitx.enable = lib.mkDefault true;
    niri.enable = lib.mkDefault true;
  };
}
