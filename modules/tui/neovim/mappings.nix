{...}: {
  os.programs.nvf = {
    settings.vim.maps = {
      normal = {
        "<leader>e".action = ":Neotree toggle reveal<CR> position=right";
      };
    };
  };
}
