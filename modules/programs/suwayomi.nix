{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.programs.gui.suwayomi;
in {
  options.programs.gui.suwayomi.enable = lib.mkEnableOption "Desktop manga/manwha reader";

  config = lib.mkIf cfg.enable {
    os.services.suwayomi-server = {
      enable = true;
      openFirewall = true;
      settings = {
        server = {
          enableSystemTray = true;
          port = 8081;

          extensionRepos = [
            "https://raw.githubusercontent.com/keiyoushi/extensions/repo/index.min.json"
          ];
          webUIEnabled = true;
          webUIInterface = "browser";
          webUIFlavor = "WebUI";
        };
      };
    };
  };
}
