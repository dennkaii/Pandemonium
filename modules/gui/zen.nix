{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: let
  cfg = config.gui.zen;
in {
  options.gui.zen.enable = lib.mkEnableOption "zen browser";

  config = lib.mkIf cfg.enable {
    inputs.zen-browser.url = "github:dennkaii/zen-browser-flake";

    hm.home.packages = with pkgs; [inputs.zen-browser.packages."${system}".default];
  };
}
