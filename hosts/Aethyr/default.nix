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
    niri.enable = true;
    fcitx.enable = true;
  };
}
