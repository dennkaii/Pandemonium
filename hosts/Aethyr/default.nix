{
  pkgs,
  inputs,
  ...
}: let
  wallpkgs = inputs.wallpkgs.packages.${pkgs.system}.oxocarbon;
in {
  imports = [./hardware];

  users = {
    main = "dennkaii";
    host = "Aethyr";
  };
  defaults = {
    wallpaper = "${wallpkgs}/share/wallpapers/oxocarbon/02.png";
    terminal = "wezterm";
    cursor = {
      name = "Breeze_Snow";
      size = 24;
      pkg = pkgs.kdePackages.breeze;
    };
  };

  desktops = {
    enable = true;
    niri.enable = true;
    fcitx.enable = true;
  };

  core = {
    enable = true;
    fprint.enable = true;
  };

  cli = {
    enable = true;
    git.enable = true;
    starship.enable = true;
    graphite.enable = true;
    nu.enable = true;
  };

  gui = {
    enable = true;
    discord.enable = true;
    mako.enable = true;
    obs.enable = true;
    wezterm.enable = true;
    # schizofox.enable = true;
    chromium.enable = true;
    _1password.enable = true;
    waybar.enable = true;
    rofi.enable = true;
    tidal.enable = true;
    utilities.enable = true;
    zen.enable = true;
    nyxt.enable = true;
    notes.enable = true;
    games = {
      steam.enable = true;
      lutris.enable = true;
      minecraft.enable = true;
      osu-lazer.enable = true;
    };
  };

  tui = {
    enable = true;
    neovim.enable = true;
    superfile.enable = true;
    rmpc.enable = true;
  };

  services = {
    vm.enable = true;
    ssh.enable = true;
    kde.enable = true;
    searxng.enable = true;
    suwayomi.enable = true;
  };
}
