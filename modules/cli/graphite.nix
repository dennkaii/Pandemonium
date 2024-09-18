{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.cli.graphite;
in {
  options.cli.graphite.enable = lib.mkEnableOption "graphite-cli for xd?";

  config = lib.mkIf cfg.enable {
    hm.home.packages = [
      pkgs.graphite-cli
    ];
  };
}
