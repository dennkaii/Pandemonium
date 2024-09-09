{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.programs._1password;
in {
  options.programs._1password.enable = lib.mkEnableOption "password_Manager";

  config = lib.mkIf cfg.enable {
    os.programs = {
      _1password-gui = {
        enable = true;
        polkitPolicyOwners = ["${config.users.main}"];
      };
      _1password = {
        enable = true;
      };
    };

    os.environment.etc = {
      "1password/custom_allowed_browsers" = {
        text = ''zen-alpha'';
        mode = "0755";
      };
    };
  };
}
