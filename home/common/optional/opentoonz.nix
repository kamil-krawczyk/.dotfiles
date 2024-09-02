{ config, lib, pkgs, ... }:

with lib;

{
  options.user.opentoonz.enable = mkEnableOption "";

  config = mkIf config.user.opentoonz.enable {
    home.packages = with pkgs; [
      opentoonz
    ];
  };
}
