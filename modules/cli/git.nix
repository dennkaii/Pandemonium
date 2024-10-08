{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.cli.git;
  inherit (lib) mkEnableOption mkIf;
in {
  options.cli.git = {
    enable = mkEnableOption "git";
  };

  config = mkIf cfg.enable {
    os.environment.systemPackages = with pkgs; [
      git
      gh
      gitmoji-cli
      lazygit
    ];

    hm.programs.git = {
      enable = true;
      userName = "dennkaii";
      userEmail = "githubdennkaii.q3i49@simplelogin.com";
    };
  };
}
