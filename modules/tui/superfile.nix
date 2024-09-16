{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: let
  cfg = config.tui.superfile;
in {
  options.tui.superfile.enable = lib.mkEnableOption "superfile";

  config = lib.mkIf cfg.enable {
    inputs.superfile.url = "github:MHNightCat/superfile";

    hm.home.packages = [
      inputs.superfile.packages.${pkgs.hostPlatform.system}.default
    ];
  };
}
