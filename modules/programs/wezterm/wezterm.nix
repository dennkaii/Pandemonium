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
    hm = {
      programs.wezterm = {
        enable = true;
        package = inputs.wezterm.packages.${pkgs.system}.default;
        colorSchemes = let
          colors = inputs.basix.schemeData.base16.oxocarbon-dark.palette;
        in
          import ./colorSchemes.nix {inherit colors;};
        extraConfig = ''
          local wez = require("wezterm")
          local act = wezterm.action
          local baseConfig = {
           -- general
           check_for_updates = false, -- nix has updates covered, I don't care about updates
           exit_behavior = "CloseOnCleanExit",
           enable_scroll_bar = false,
           enable_wayland = true,
           audible_bell = "Disabled", -- annoying
           warn_about_missing_glyphs =  false,

           -- anims
            animation_fps = 1,

           -- term window settings
           adjust_window_size_when_changing_font_size = false,
           window_background_opacity = 0.85,
           window_padding = { left = 12, right = 12, top = 12, bottom = 12, },
           window_close_confirmation = "NeverPrompt",
           inactive_pane_hsb = {
            saturation = 1.0,
            brightness = 0.8
           },

           -- cursor
           default_cursor_style = "SteadyBar",
           cursor_blink_rate = 700,
           cursor_blink_ease_in = 'Constant',
           cursor_blink_ease_out = 'Constant',

           -- tab bar
           enable_tab_bar = true, -- no observable performance impact
           use_fancy_tab_bar = false,
           hide_tab_bar_if_only_one_tab = true,
           show_tab_index_in_tab_bar = false,

           -- font config
           font_size = 14.0,
           font = wezterm.font_with_fallback {
           'Maple Mono NF',
           },

           -- perf
           front_end = "WebGpu",
           enable_wayland = true,
           scrollback_lines = 10000,

           -- keybinds
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


           -- colors
           -- the followSystem theme is defined in colorSchemes.nix
           -- as per my base16 theming options
           color_scheme = "followSystem",
          }

          return baseConfig
        '';
      };
    };
  };
}
#Special thanks to raf for letting me steal his config for this lmao
#https://github.com/NotAShelf/nyx/blob/main/homes/notashelf/programs/terminal/emulators/wezterm/default.nix

