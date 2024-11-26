{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.core.fprint;
in {
  options.core.fprint.enable = lib.mkEnableOption "fingerprint";

  config = lib.mkIf cfg.enable {
    os.systemd.services.fprintd = {
      wantedBy = ["multi-user.target"];
      serviceConfig.Type = "simple";
    };
    os.services.fprintd.enable = true;
    os.services.fprintd.tod.enable = true;
    os.services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;
  };
}
