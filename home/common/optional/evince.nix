{ config, lib, pkgs, ... }:

with lib;

{
  options.user.evince.enable = mkEnableOption "";

  config = mkIf config.user.evince.enable {
    home.packages = with pkgs; [
      evince
    ];
  };
}
