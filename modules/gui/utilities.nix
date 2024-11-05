{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.gui.utilities;
in {
  options.gui.utilities.enable = lib.mkEnableOption "utilities i dont want to make a module for kekw";

  config = lib.mkIf cfg.enable {
    os.services.gnome.sushi.enable = true;

    hm.home.packages = with pkgs; [
      pwvucontrol
      alsa-utils
      libreoffice-qt
      stremio
      ani-cli
      blender
      foliate
      btop
      element-desktop
      macchina
      rar
      nautilus
      socat
      anki
      jq
    ];
  };
}
