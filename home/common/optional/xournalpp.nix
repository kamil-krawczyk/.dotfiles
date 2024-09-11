{ config, lib, pkgs, ... }:

with lib;

{
  options.user.xournalpp.enable = mkEnableOption "";

  config = mkIf config.user.xournalpp.enable {
    home.packages = with pkgs; [
      xournalpp
    ];
  };
}
