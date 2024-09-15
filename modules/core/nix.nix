{
  inputs,
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.core.nix;
  nixSettings = {
    # Free up to 20GiB whenever there is less than 5GB left.
    # this setting is in bytes, so we multiply with 1024 thrice
    min-free = "${toString (5 * 1024 * 1024 * 1024)}";
    max-free = "${toString (20 * 1024 * 1024 * 1024)}";
    # automatically optimise symlinks
    auto-optimise-store = true;

    sandbox = true;
    max-jobs = 4;

    keep-going = true;
    log-lines = 30;

    keep-derivations = true;
    keep-outputs = true;

    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
      "https://hyprland.cachix.org"
      "https://cache.privatevoid.net"
      "https://nyx.cachix.org"
      "https://nix-gaming.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "cache.privatevoid.net:SErQ8bvNWANeAvtsOESUwVYr2VJynfuc9JRwlzTTkVg="
      "nyx.cachix.org-1:xH6G0MO9PrpeGe7mHBtj1WbNzmnXr7jId2mCiq6hipE="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
    ];

    trusted-users = [
      "root"
      "@wheel"
    ];

    extra-experimental-features = [
      "flakes"
      "nix-command"
      "ca-derivations"
      "recursive-nix"
      "auto-allocate-uids"
      "configurable-impure-env"
    ];
  };
in {
  options.core.nix.enable = lib.mkEnableOption "Core settings and patched nix for combined-manager to work";
  config = lib.mkIf cfg.enable {
    inputs = {
      # nix-super.url = "github:privatevoid-net/nix-super";
      nix-dram = {
        url = "github:dramforever/nix-dram";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

    hm.nix.settings = nixSettings;

    os = {
      documentation = {
        enable = true;
        doc.enable = true;
        man.enable = true;
      };
      nixpkgs = {
        overlays = [
          (final: prev: {
            nix = inputs.nix-dram.packages.${pkgs.system}.default.overrideAttrs (old: {
              patches =
                old.patches
                or []
                ++ [
                  (pkgs.fetchpatch {
                    url = "https://raw.githubusercontent.com/Noah765/combined-manager/main/nix-patches/2.24.4/evaluable-flake.patch";
                    hash = "sha256-72mFg401gUMeSRMqxdcFhW4e4FCFMMz2AFhwoxqg8oc=";
                  })
                ];
            });
          })
        ];
      };
      nix = {
        # make builds run with low priority so my system stays responsive
        # this is especially helpful if you have auto-upgrade on
        daemonCPUSchedPolicy = "batch";
        daemonIOSchedClass = "idle";
        daemonIOSchedPriority = 7;

        gc = {
          automatic = true;
          dates = "*-*-* 10:00";
          persistent = true;
          options = "--delete-older-than 2d";
        };

        optimise = {
          automatic = true;
          dates = ["11:00"];
        };

        settings = nixSettings;
      };
    };
    hm.programs.nix-index.enable = true;
  };
}
