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
    ./pipewire.nix
  ];

  config.core = lib.mkIf cfg.enable {
    nix.enable = lib.mkDefault true;
    audio.enable = lib.mkDefault true;
  };
}
