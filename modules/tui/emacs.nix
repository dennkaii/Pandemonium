{
  config,
  lib,
  ...
}: let
  cfg = config.tui.emacs;
  inherit (lib) mkIf mkEnableOption;
in {
  options.tui.emacs.enable = mkEnableOption "pointless module idk why i still have";

  config = mkIf cfg.enable {
    hm = {
      services.emacs = {
        enable = true;

        client.enable = true;
      };
    };
  };
}
