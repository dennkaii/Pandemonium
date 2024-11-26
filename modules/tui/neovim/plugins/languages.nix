{
  programs.nvf.settings.vim.languages = {
    enableLSP = true;
    enableFormat = true;
    enableTreesitter = true;
    nix.enable = true;
    rust = {
      enable = true;
      # crates.enable = true;
    };
    html.enable = true;
    python.enable = true;
    markdown.enable = true;
    bash.enable = true;
    lua.enable = true;
  };
}
