{ config, lib, ... }:

with lib;

{
  options.user.firefox.enable = mkEnableOption "";

  config = mkIf config.user.firefox.enable {
    programs.firefox = {
      enable = true;
    };
  };
}
