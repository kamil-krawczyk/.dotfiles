{ config, lib, ... }:

with lib;

{
  options.user.bundle.development.enable = mkEnableOption "";

  config = mkIf config.user.bundle.development.enable {
    user = {
      git.enable = true;
      direnv.enable = true;
      misc.enable = true;
    };
  };
}
