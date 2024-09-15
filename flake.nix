let
  combinedManager = import (builtins.fetchTarball {
    url = "https://github.com/flafydev/combined-manager/archive/1741d07e3c2031f39cef8279acd4f172a3b058da.tar.gz"; # Replace REV with the current revision of Combined Manager.
    sha256 = "1qvjwmbkkplflz6bhahdbag1bld4y4icm9lm8634x5f6rjjp5fha"; # Replace HASH with the corresponding hash.
  });
in
  combinedManager.mkFlake {
    description = "yet another another flake oml";

    lockFile = ./flake.lock;

    initialInputs = {
      combined-manager.url = "github:Noah765/combined-manager";
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      flake-parts.url = "github:hercules-ci/flake-parts";
      basix.url = "github:NotAShelf/Basix";
    };

    globalModules = [
      ./modules
    ];

    configurations = {
      Aethyr = {
        modules = [
          ./hosts/Aethyr
          ./configs/dennkaii
        ];
      };
    };

    outputs = inputs @ {
      flake-parts,
      self,
      ...
    }:
      flake-parts.lib.mkFlake {inherit inputs self;} {
        systems = [
          "x86_64-linux"
        ];
        perSystem = {pkgs, ...}: {
          formatter = pkgs.alejandra;
        };
      };
  }
# TOOK as reference
# https://github.com/n3oney/nixus/blob/main/flake.nix
# https://github.com/FlafyDev/nixos-config/blob/main/flake.nix

