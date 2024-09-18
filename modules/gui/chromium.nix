{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: let
  cfg = config.gui.chromium;
  inherit (lib) mkIf mkEnableOption;
in {
  options.gui.chromium.enable = mkEnableOption "uchromium";

  config = mkIf cfg.enable {
    inputs.chrome-pwa.url = "github:luis-hebendanz/nixos-chrome-pwa";

    osModules = [
      inputs.chrome-pwa.nixosModule
      ({
        config,
        pkgs,
        ...
      }: {
        services.chrome-pwa.enable = true;
      })
    ];

    hm = {
      home.packages = with pkgs; [
        chromium
      ];
    };
  };
}
