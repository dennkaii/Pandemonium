{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.display.niri;
in {
  config = lib.mkIf cfg.enable {
    os.environment.systemPackages = with pkgs; [xwayland-satellite xwayland];
    os.systemd.user.services.xwayland-satellite = {
      description = "Xwayland outside your Wayland";

      enable = false;
      wantedBy = ["graphical-session.target"];
      bindsTo = ["graphical-session.target"];
      partOf = ["graphical-session.target"];
      after = ["graphical-session.target"];
      requisite = ["graphical-session.target"];

      serviceConfig = {
        Type = "notify";
        NotifyAccess = "all";
        ExecStart = "/${pkgs.xwayland-satellite}/bin/xwayland-satellite";
        StandardOutput = "journal";

        Restart = "on-failure";
        RestartSec = "2s";
      };
    };
  };
}
