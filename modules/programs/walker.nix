{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: let
  cfg = config.programs.walker;
  inherit (lib) mkIf mkEnableOption;
in {
  options.programs.walker.enable = mkEnableOption "anyrun replacement";

  config = mkIf cfg.enable {
    inputs.walker.url = "github:abenz1267/walker";

    hmModules = [inputs.walker.homeManagerModules.default];

    hm.programs.walker = {
      enable = true;
      runAsService = true;
      package = inputs.walker.packages.${pkgs.hostPlatform.system}.default;

      config = {
        placeholder = "Type Something...";
        fullscreen = true;
        show_initial_entries = false;

        search = {
          hide_icons = false;
          hide_spinner = true;
        };
      };
    };
  };
}
