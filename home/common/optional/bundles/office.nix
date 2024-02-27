{ config, lib, ... }:

with lib;

{
  options.user.bundle.office.enable = mkEnableOption "";

  config = mkIf config.user.bundle.office.enable {
    user = {
      libreoffice.enable = true;
      evince.enable = true;
    };
  };
}
