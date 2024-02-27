{ config, lib, pkgs, ... }:

with lib;

{
  options.user.libreoffice.enable = mkEnableOption "";

  config = mkIf config.user.libreoffice.enable {
    home.packages = with pkgs; [
      libreoffice
    ];
  };
}
