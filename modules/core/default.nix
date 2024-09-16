{
  lib,
  config,
  ...
}: let
  cfg = config.core;
in {
  options.core.enable = lib.mkEnableOption "core programs for a working nixos machine";
  imports = [
    ./nix.nix
    ./users.nix
    ./xdg.nix
    ./nix-helper.nix
    ./pipewire.nix

    #Must make a module for
    ./fonts.nix
    ./gtk.nix
  ];

  config.core = lib.mkIf cfg.enable {
    nix.enable = lib.mkDefault true;
    audio.enable = lib.mkDefault true;
    xdg.enable = lib.mkIf config.desktops.enable (lib.mkDefault true);
    nix-helper.enable = lib.mkIf config.core.nix (lib.mkDefault true);
  };
}
