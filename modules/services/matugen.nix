{
  config,
  lib,
  inputs,
  ...
}: let
  cfg = config.services.matugen;
in {
  options.services.matugen.enable = lib.mkEnableOption "matugen";

  config = lib.mkIf cfg.enable {
    inputs.matugen.url = "github:Theaninova/matugen/add-home-manager-module";
  };
}
