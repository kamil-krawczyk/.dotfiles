{ config, lib, ... }:

with lib;

{
  options.host.libvirtd.enable = mkEnableOption "";

  config = mkIf config.host.libvirtd.enable {
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;

    # Ensure group exists
    users.groups = {
      libvirtd = { };
    };
  };
}
