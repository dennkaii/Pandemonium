{
  lib,
  config,
  ...
}: let
  cfg = config.tui;
in {
  imports = [
    ./neovim/neovim.nix
    ./superfile.nix
    ./emacs.nix
    ./helix/helix.nix
    ./rmpc.nix
  ];
  options.tui.enable = lib.mkEnableOption "Text-based user interface programs";

  config.tui = lib.mkIf cfg.enable {
    neovim.enable = lib.mkDefault true;
    superfile.enable = lib.mkDefault false;
    emacs.enable = lib.mkDefault false;
    helix.enable = lib.mkDefault false;
    rmpc.enable = lib.mkDefault false;
  };
}
