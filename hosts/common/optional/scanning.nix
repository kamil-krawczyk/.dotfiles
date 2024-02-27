{ config, lib, pkgs, ... }:

with lib;

{
  options.host.scanning.enable = mkEnableOption "";

  config = mkIf config.host.scanning.enable {
    hardware.sane = {
      enable = true;
      openFirewall = true;
      extraBackends = with pkgs; [ hplip ];
    };

    # Ensure group exists
    users.groups = {
      scanner = { };
      lp = { };
    };
  };
}
