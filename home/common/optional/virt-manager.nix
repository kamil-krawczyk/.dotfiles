{ config, lib, hostConfig, ... }:

with lib;

{
  config = mkIf hostConfig.libvirtd.enable {
    # https://nixos.wiki/wiki/Virt-manager
    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = [ "qemu:///system" ];
        uris = [ "qemu:///system" ];
      };
    };
  };
}
