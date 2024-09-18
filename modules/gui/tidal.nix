{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.gui.tidal;
in {
  options.gui.tidal.enable = lib.mkEnableOption "Tidal desktop app fuck electron";

  config = lib.mkIf cfg.enable {
    hm.home.packages = [
      pkgs.tidal-hifi
    ];
  };
}
