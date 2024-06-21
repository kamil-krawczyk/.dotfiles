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

      socat
      netcat

      # gcc derivation provides some useful tools, such as ar or strings
      gcc
      coreutils
      rlwrap
    ];
  };
}
