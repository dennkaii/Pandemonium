{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.tui.neovim;
in {
  options.tui.neovim.enable = lib.mkEnableOption "nvf";

  config = lib.mkIf cfg.enable {
    inputs = {
      nvf = {
        url = "github:notashelf/nvf/v0.7";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

    osModules = [
      inputs.nvf.nixosModules.default
      ./plugins
      ./settings.nix
    ];
    hm.home.sessionVariables.EDITOR = "nvim";

    os.programs.nvf = {
      enable = true;
      settings = {
        vim = {
          theme = {
            enable = true;
            name = "oxocarbon";
            style = "dark";
          };

          comments = {
            comment-nvim.enable = true;
          };

          binds = {
            # whichKey.enable = true;
            cheatsheet.enable = true;
          };
        };
      };
    };
  };
}
