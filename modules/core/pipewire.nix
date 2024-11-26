{
  config,
  lib,
  ...
}: let
  cfg = config.core.audio;
in {
  options.core.audio.enable = lib.mkEnableOption "either pipewire or pulseaudio";

  config = lib.mkIf cfg.enable {
    os.services.pipewire = {
      enable = true;
      audio.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
      jack.enable = true;
    };
  };
}
