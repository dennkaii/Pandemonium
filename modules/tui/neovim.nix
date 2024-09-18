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
        url = "github:notashelf/nvf";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

    osModules = [inputs.nvf.nixosModules.default];

    hm.home.sessionVariables.EDITOR = "nvim";

    os.programs.nvf = {
      enable = true;
      settings = {
        vim = {
          package = pkgs.neovim-unwrapped;
          autoIndent = true;
          autocomplete.enable = true;
          autopairs.enable = true;
          enableEditorconfig = true;
          preventJunkFiles = true;
          enableLuaLoader = true;
          useSystemClipboard = true;
          hideSearchHighlight = true;
          spellcheck.enable = true;
          disableArrows = true;

          binds.cheatsheet.enable = true;

          dashboard.alpha = {
            enable = true;
          };
          filetree.neo-tree = {
            enable = true;
          };

          # tabline.nvimBufferLine = {
          #   enable = true;
          # };
          telescope = {
            enable = true;
          };

          languages = {
            enableLSP = true;
            enableFormat = true;
            enableTreesitter = true;
            nix.enable = true;
            rust.enable = true;
            html.enable = true;
            ts.enable = true;
          };
          lsp = {
            formatOnSave = true;
            lspkind.enable = true;
            lightbulb.enable = false;
            lspsaga.enable = true;
            nvimCodeActionMenu.enable = false;
            trouble.enable = false;
            lspSignature.enable = true;
            lsplines.enable = true;
            lspconfig.enable = true;
            nvim-docs-view.enable = true;
          };

          comments = {
            comment-nvim.enable = true;
          };

          statusline = {
            lualine = {
              enable = true;
              theme = "auto";
            };
          };
        };
      };
    };
  };
}
