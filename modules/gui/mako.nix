{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.gui.mako;
  inherit (lib) mkIf mkEnableOption;
in {
  options.gui.mako.enable = mkEnableOption "mako";

  config = mkIf cfg.enable {
    hm = {
      services.mako = {
        enable = true;
        defaultTimeout = 5;
        borderRadius = 5;
        anchor = "top-center";
      };
    };
  };
}
