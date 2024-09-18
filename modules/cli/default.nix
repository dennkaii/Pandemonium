{
  lib,
  config,
  ...
}: let
  cfg = config.cli;
in {
  imports = [
    ./git.nix
    ./starship.nix
    ./ompsh.nix
    ./radicle.nix
    ./nu.nix
    ./graphite.nix
    ./fish.nix
  ];
  options.cli.enable = lib.mkEnableOption "cli programs modules";

  config.cli = lib.mkIf cfg.enable {
    git.enable = lib.mkDefault true;
    starship.enable = lib.mkDefault false;
    ompsh.enable = lib.mkDefault false;
    radicle.enable = lib.mkDefault false;
    nu.enable = lib.mkDefault false;
    graphite.enable = lib.mkDefault false;
    fish.enable = lib.mkDefault false;
  };
}
