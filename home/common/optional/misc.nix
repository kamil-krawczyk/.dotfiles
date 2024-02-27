{ config, lib, pkgs, ... }:

with lib;

{
  options.user.misc.enable = mkEnableOption "";

  config = mkIf config.user.misc.enable {
    home.packages = with pkgs; [
      nil
      marksman

      bat

      silver-searcher
      fzf
      jq

      toybox

      socat
      netcat
    ];
  };
}
