{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.desktops.fcitx;

  inherit (lib) mkEnableOption mkIf;
in {
  options.desktops.fcitx.enable = mkEnableOption "fcitx";

  config = mkIf cfg.enable {
    hm = {
      i18n.inputMethod = {
        enabled = "fcitx5";
        fcitx5.addons = with pkgs; [
          fcitx5-hangul
          fcitx5-gtk
        ];
      };
    };
  };
}
