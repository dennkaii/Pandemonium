{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.tui.rmpc;
in {
  options.tui.rmpc.enable = lib.mkEnableOption "rusty music player";
  config = lib.mkIf cfg.enable {
    hm.home.packages = [
      pkgs.rmpc
    ];
  };
}
