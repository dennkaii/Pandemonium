{
  programs.nvf.settings.vim = {
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
  };
}
