{
  pkgs,
  lib,
  ...
}:
# let
#   # inherit (lib.generators) mkLuaInline;
#in
{
  programs.nvf.settings.vim.extraPlugins = with pkgs.vimPlugins; {
    flash = {
      package = flash-nvim;
      setup = "require('flash').setup{}";
    };
  };
}
# thanks to https://github.com/diniamo/niqs/blob/main/home/nvf/plugins/motion.nex

