{
  config,
  lib,
  ...
}: let
  cfg = config.services.tailscale;
  inherit (lib) mkEnableOption mkIf;
in {
  options.services.tailscale.enable = mkEnableOption "tailscale tho i'm not using it at all kekw";

  config = mkIf cfg.enable {
    os.services.tailscale.enable = true;
  };
}
