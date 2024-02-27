{ config, lib, pkgs, ... }:

with lib;

{
  options.user.google-chrome.enable = mkEnableOption "";

  config = mkIf config.user.google-chrome.enable {
    home.packages = with pkgs; [
      google-chrome
    ];
  };
}
