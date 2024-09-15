{
  config,
  pkgs,
  ...
}: {
  users.main = "dennkaii";

  defaults = {
    terminal = "wezterm";
    cursor = {
      name = "Breeze_Snow";
      size = 24;
      pkg = pkgs.kdePackages.breeze;
    };
    wallpaper = "${toString config.defaults.flake_dir}/wallpapers/tile-tapestry.jpeg";
  };

  display = {
    # hyprland.enable = true;
    river.enable = false;
    #not used anymore
    # sddm.enable = true;
    # for 한굴
    fcitx.enable = true;
    niri.enable = true;
  };

  fonts.enable = true;

  gtk.enable = true;

  #virtualmachine bs
  vm.enable = true;

  programs = {
    editor = {
      neovim.enable = true;
      helix.enable = false;
    };
    _1password.enable = true;
    # packages i was lazy to make a module for
    packages.enable = true;

    mako.enable = true;
    walker.enable = true;
    #Wigets
    qs.enable = true;
    #Git
    git.enable = true;
    #Idr now
    prism.enable = false;
    # browser
    uchromium.enable = true;
    # terminal file manager with alot of funny things
    superfile.enable = true;
    #Vesktop discord
    discord.enable = true;
    starship.enable = true;
    #Wallpapaer, lockscreen and idle daemon
    hyprlock.enable = true;
    hypridle.enable = true;
    # Not Being used
    waybar.enable = true;
    # kdeConnect
    kde.enable = false;
    #Terminal prompt theming
    #Recording
    obs.enable = false;
    #Default shell
    nu.enable = true;
    #browser
    schizofox.enable = true;
    # Foot terminal but seems broken
    terminals = {
      wezterm.enable = true;
      foot.enable = false;
    };
    gui = {
      #manga reader
      suwayomi.enable = true;
    };
    #terminal multiplexer but plugins no worky
    #define fonts and global theme
    # literal games
    games = {
      osu-lazer.enable = true;
      steam.enable = true;
      minecraft.enable = true;
      lutris.enable = true;
    };

    # DISABLED FOREVER PROBABLY
    fish.enable = false;
    radicle.enable = false;
    fuzzel.enable = false;
    stylix.enable = false;
    anyrun.enable = false;
    arduino.enable = false;
    hyprpaper.enable = false;
    ompsh.enable = false;
    #Migrated to ompsh
  };

  services = {
    ssh.enable = true;
    tailscale.enable = false;
    protonvpn.enable = false;
    podman.enable = false;

    searxng.enable = false;
  };
}
