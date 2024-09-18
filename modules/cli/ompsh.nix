{
  config,
  lib,
  ...
}: let
  cfg = config.cli.ompsh;
  inherit (lib) mkIf mkEnableOption;
in {
  options.cli.ompsh.enable = mkEnableOption "terminal prompt for any shell";

  config = mkIf cfg.enable {
    hm.programs.eza = {
      enable = true;
      enableNushellIntegration = true;
      # enableAliases = true;
      icons = true;
    };

    hm.programs.oh-my-posh = {
      enable = true;
      useTheme = "tokyonight_storm";

      # settings = let
      #   end = "";
      #   start = "";
      # in {
      #   schema = "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json";
      #
      #   # format = """
      #   # $cmd_duration$username$hostname $directory $git_branch
      #   # $character
      #   # """
      #   terminal_space = true;
      #   blocks = [
      #     {
      #       type = "prompt";
      #       alignment = "left";
      #       newline = true;
      #
      #       segments = [
      #         {
      #           type = "executiontime";
      #           style = "diamond";
      #           leading_diamond = "";
      #           trailing_diamond = "";
      #           backgorund = "transparent";
      #           template = "{{ .Ms }} ";
      #         }
      #       ];
      #     }
      #   ];
      # };
    };
  };
}
