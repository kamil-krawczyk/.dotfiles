{ config, lib, ... }:

with lib;

{
  options.user.direnv.enable = mkEnableOption "";

  config = mkIf config.user.direnv.enable
    {
      programs.direnv = {
        enable = true;
        enableBashIntegration = true;
        nix-direnv.enable = true;
      };
    };
}
