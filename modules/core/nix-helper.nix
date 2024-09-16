{
  lib,
  config,
  ...
}: let
  cfg = config.core.nix-helper;
in {
  options.core.nix-helper.enable = lib.mkEnableOption "nix-helper";

  config = lib.mkIf cfg.enable {
    os.environment.variables.FLAKE = "${toString config.defaults.flake_dir}";
    os.programs.nh = {
      enable = true;
    };
  };
}
