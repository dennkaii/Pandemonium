{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.gui.nyxt;
in {
  options.gui.nyxt.enable = lib.mkEnableOption "nyxt browser";

  config = lib.mkIf cfg.enable {
    hm.home.packages = with pkgs; [nyxt];
  };
}
