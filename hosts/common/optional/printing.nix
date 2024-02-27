{ config, lib, pkgs, ... }:

with lib;

{
  options.host.printing.enable = mkEnableOption "";

  config = mkIf config.host.printing.enable {
    services = {
      printing = {
        enable = true;
        drivers = with pkgs; [ hplip ];
      };
      avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
    };
  };
}
