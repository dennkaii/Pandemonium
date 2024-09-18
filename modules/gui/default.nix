{
  lib,
  config,
  ...
}: let
  cfg = config.gui;
in {
  imports = [
    ./anyrun.nix
    ./chromium.nix
    ./discord/discord.nix
    ./foot.nix
    ./fuzzel.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./mako.nix
    ./obs.nix
    ./schizofox.nix
    ./walker.nix
    ./waybar.nix
    ./wezterm/wezterm.nix
    ./1password.nix
    ./zen.nix
    ./tidal.nix
    ./utilities.nix
    ./games/osu.nix
    ./games/gaming.nix
    ./games/minecraft.nix
  ];
  options.gui.enable = lib.mkEnableOption "Programs dependant of the graphical environment";

  config.gui = lib.mkIf cfg.enable {
    anyrun.enable = lib.mkDefault false;
    chromium.enable = lib.mkDefault false;
    discord.enable = lib.mkDefault false;
    foot.enable = lib.mkDefault false;
    fuzzel.enable = lib.mkDefault false;
    hyprlock.enable = lib.mkDefault false;
    hyprpaper.enable = lib.mkDefault false;
    mako.enable = lib.mkDefault false;
    obs.enable = lib.mkDefault false;
    schizofox.enable = lib.mkDefault false;
    walker.enable = lib.mkDefault false;
    waybar.enable = lib.mkDefault false;
    wezterm.enable = lib.mkDefault false;
    _1password.enable = lib.mkDefault false;
    zen.enable = lib.mkDefault false;
    tidal.enable = lib.mkDefault false;
    utilities.enable = lib.mkDefault false;

    games = {
      steam.enable = lib.mkDefault false;
      lutris.enable = lib.mkDefault false;
      minecraft.enable = lib.mkDefault false;
      osu-lazer.enable = lib.mkDefault false;
    };
  };
}
