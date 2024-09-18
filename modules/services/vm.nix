{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.services.vm;
  inherit (lib) mkIf mkEnableOption;
in {
  options.services.vm = {
    enable = mkEnableOption "virtual manager for making virtual machines.";
  };

  config = mkIf cfg.enable {
    users.groups = ["libvirtd"];

    hm = {
      dconf.settings = {
        "org/virt-manager/virt-manager/connections" = {
          autoconnect = ["qemu:///system"];
          uris = ["qemu:///system"];
        };
      };
    };

    os = {
      virtualisation = {
        libvirtd = {
          enable = true;
          qemu = {
            package = pkgs.qemu_kvm;
            swtpm.enable = true;
            ovmf.enable = true;
            ovmf.packages = [pkgs.OVMFFull.fd];
          };
        };
        spiceUSBRedirection.enable = true;
      };

      programs.virt-manager.enable = true;

      programs.dconf.enable = true;
    };
  };
}
