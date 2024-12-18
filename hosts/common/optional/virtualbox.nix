{ config, lib, ... }:

with lib;

{
  options.host.virtualbox.enable = mkEnableOption "";

  config = mkIf config.host.virtualbox.enable {
    virtualisation.virtualbox.host.enable = true;
    users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];
  };
}
