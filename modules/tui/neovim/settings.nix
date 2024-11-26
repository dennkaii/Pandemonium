{
  config,
  pkgs,
  inputs,
  ...
}: {
  config = {
    programs.nvf.settings.vim = {
      package = pkgs.neovim-unwrapped;
      vimAlias = false;
      viAlias = false;

      autoIndent = true;
      autocomplete.nvim-cmp.enable = true;
      autopairs.nvim-autopairs.enable = true;
      enableEditorconfig = true;
      preventJunkFiles = true;
      enableLuaLoader = true;
      useSystemClipboard = true;
      spellcheck = {
        enable = true;
        languages = ["en"];
      };
      hideSearchHighlight = true;
      searchCase = "smart";
      splitRight = true;
      disableArrows = true;
    };
  };
}
