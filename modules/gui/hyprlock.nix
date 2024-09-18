{
  lib,
  config,
  ...
}: let
  cfg = config.gui.hyprlock;
  inherit (lib) mkEnableOption mkIf;
in {
  options.gui.hyprlock.enable = mkEnableOption "hyprlock";

  config = mkIf cfg.enable {
    hm.programs.hyprlock = {
      enable = true;

      settings = {
        general.hide_cursor = false;

        background = [
          {
            path = "";
            monitor = "";
            # color = "rgba(25, 20, 20, 1.0)";
            blur_size = 3;
            blur_passes = 4;
            noise = 0.03;
          }
        ];

        input-field = [
          {
            monitor = "eDP-1";

            # placeholder_text = "<b>Do you know me?</b>";
            dots_center = true;
            dots_spacing = 0.3;
            fade_on_empty = true;
          }
        ];

        label = [
          {
            monitor = "";
            text = "$TIME";

            position = {
              x = 0;
              y = 100;
            };

            valign = "center";
            halign = "center";
          }
        ];

        # input_fields = {
        #   placeholder_text = "<i><b>Guess the pwd...</i></b>";
        # };

        # labels = {
        # text = "<b>$TIME</b>";
        # };
      };
    };
  };
}
