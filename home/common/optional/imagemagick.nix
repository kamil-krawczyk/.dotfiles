{ config, lib, pkgs, ... }:

with lib;

{
  options.user.imagemagick.enable = mkEnableOption "";

  config = mkIf config.user.imagemagick.enable {
    home.packages = with pkgs; [
      imagemagick
    ];
  };
}
