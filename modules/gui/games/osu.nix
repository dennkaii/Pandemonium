{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.programs.gui.osu-lazer;
  inherit (lib) mkEnableOption mkIf;
in {
  options.gui.games = {
    osu-lazer.enable = mkEnableOption "osu-lazer";
  };

  config = mkIf cfg.enable {
    inputs.nix-gaming.url = "github:fufexan/nix-gaming";

    os.environment.systemPackages = [
      inputs.nix-gaming.packages.${pkgs.hostPlatform.system}.osu-lazer-bin
    ];
  };
}
