{
  config,
  lib,
  ...
}: let
  cfg = config.services;
  inherit (lib) mkDefault mkEnableOption;
in {
  imports = [
    ./vm.nix
    ./podman.nix
    ./searng.nix
    ./ssh.nix
    ./tailscale.nix
    ./agenix.nix
    ./hypridle.nix
    ./suwayomi.nix
    ./kdeconnect.nix
    ./matugen.nix
  ];
  options.services.enable = mkEnableOption "services like ";

  config.services = lib.mkIf cfg.enable {
    vm.enable = mkDefault false;
    agenix.enable = mkDefault false;
    podman.enable = mkDefault false;
    searxng.enable = mkDefault false;
    ssh.enable = mkDefault true;
    tailscale.enable = mkDefault false;
    hypridle.enable = mkDefault false;
    suwayomi.enable = mkDefault false;
    kdeconnect.enable = mkDefault false;
    matugen.enable = mkDefault false;
  };
}
