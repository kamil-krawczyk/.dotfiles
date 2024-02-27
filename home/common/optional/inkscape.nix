{ config, lib, pkgs, ... }:

with lib;

{
  options.user.inkscape.enable = mkEnableOption "";

  config = mkIf config.user.inkscape.enable {
    home.packages = with pkgs; [
      inkscape
    ];
  };
}
