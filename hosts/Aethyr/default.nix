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
    enable = true;
    niri.enable = true;
  };

  core = {
    nix.enable = true;
  };
}
