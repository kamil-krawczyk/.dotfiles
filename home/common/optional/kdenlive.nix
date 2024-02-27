{ config, lib, pkgs, ... }:

with lib;

{
  options.user.kdenlive.enable = mkEnableOption "";

  config = mkIf config.user.kdenlive.enable {
    home.packages = with pkgs; [
      kdenlive
    ];
  };
}
