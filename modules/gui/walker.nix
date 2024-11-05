{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: let
  cfg = config.gui.walker;
  inherit (lib) mkIf mkEnableOption;
in {
  options.gui.walker.enable = mkEnableOption "anyrun replacement";

  config = mkIf cfg.enable {
    inputs.walker.url = "github:abenz1267/walker";

    hmModules = [inputs.walker.homeManagerModules.default];

    hm.programs.walker = {
      enable = true;
      runAsService = true;
      # package = inputs.walker.packages.${pkgs.hostPlatform.system}.default;
    };
  };
}
