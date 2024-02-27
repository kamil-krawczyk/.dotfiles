{ config, lib, pkgs, ... }:

with lib;

{
  options.user.gimp.enable = mkEnableOption "";

  config = mkIf config.user.gimp.enable {
    home.packages = with pkgs; [
      gimp
    ];
  };
}
