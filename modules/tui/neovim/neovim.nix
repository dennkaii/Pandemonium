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

  imports = [./mappings.nix];
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

          visuals = {
            nvimWebDevicons.enable = true;
          };

          theme = {
            enable = true;
            name = "oxocarbon";
            style = "dark";
          };

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

          binds = {
            cheatsheet.enable = true;
            whichKey.enable = true;
          };

          dashboard.alpha = {
            enable = true;
          };

          filetree.neo-tree = {
            enable = true;
            setupOpts = {
              git_status_async = true;
              window = {
                mapping_options = {nowait = false;};
                mappings = {
                  "<space>" = "none";
                  "l" = "open";
                  # "h" = {"@1" = "navigate_up";};
                  "z" = "none";
                  "zc" = "close_node";
                  "zC" = "close_all_nodes";
                  "v" = "open_vsplit";
                };
              };
            };
          };

          git = {
            enable = true;
            gitsigns.enable = true;
            vim-fugitive.enable = true;
          };

          tabline = {
            nvimBufferline.enable = true;
          };

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
            python.enable = true;
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
