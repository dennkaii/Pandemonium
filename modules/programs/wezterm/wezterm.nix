{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: let
  cfg = config.programs.terminals.wezterm;
  inherit (lib) mkIf mkEnableOption;
in {
  options.programs.terminals.wezterm.enable = mkEnableOption "wezterm";

  config = mkIf cfg.enable {
    inputs.wezterm = {
      url = "github:wez/wezterm?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hm.programs.wezterm = {
      enable = true;
      package = inputs.wezterm.packages.${pkgs.system}.default;
      extraConfig = ''
                  local wezterm = require 'wezterm'


                  local function font_with_fallback(name, params)
                  local names = { name, "Material Symbols Outlined"}
                  return wezterm.font_with_fallback(names, params)
                  end

                local font_name = "Maple Mono NF"


                  return {

                color_scheme = 'Oxocarbon Dark (Gogh)',
                window_background_opacity = 1.0,
                enable_tab_bar = false,
                scrollback_lines = 10000,
                window_padding = {
                  left = 25,
                  right = 25,
                  top = 25,
                  bottom = 25,
                },
                enable_wayland = true,
                check_for_updates = false,
                default_cursor_style = "SteadyBar",
                automatically_reload_config = true,

                leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 5000},

                keys = {
        {key = '-', mods = 'LEADER' , action  = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain'} },
        {key = '=', mods = 'LEADER' , action  = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain'} },
        {key = 'x', mods = 'LEADER' , action  = wezterm.action.CloseCurrentPane {confirm = false} },
        --movement
        {key = 'h', mods = 'LEADER' , action  = wezterm.action.ActivatePaneDirection "Left"},
        {key = 'j', mods = 'LEADER' , action  = wezterm.action.ActivatePaneDirection "Down"},
        {key = 'k', mods = 'LEADER' , action  = wezterm.action.ActivatePaneDirection "Up"},
        {key = 'l', mods = 'LEADER' , action  = wezterm.action.ActivatePaneDirection "Right"},
                }


                  }

      '';
    };
  };
}
