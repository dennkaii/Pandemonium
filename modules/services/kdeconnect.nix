{
  config,
  lib,
  ...
}: let
  cfg = config.services.kde;
  inherit (lib) mkEnableOption mkIf;
in {
  options.services.kde.enable = mkEnableOption "kdeconnect";

  config = mkIf cfg.enable {
    os = {
      programs.kdeconnect.enable = true;
    };
  };
}
