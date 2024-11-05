{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.gui.notes;
  inherit (lib) mkIf mkEnableOption;
in {
  options.gui.notes.enable = mkEnableOption "for note taking?";

  config = mkIf cfg.enable {
    hm.home.packages = [
      pkgs.siyuan
    ];
  };
}
