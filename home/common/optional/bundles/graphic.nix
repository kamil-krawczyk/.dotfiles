{ config, lib, ... }:

with lib;

{
  options.user.bundle.graphic.enable = mkEnableOption "";

  config = mkIf config.user.bundle.graphic.enable {
    user = {
      gimp.enable = true;
      # inkscape.enable = true;
      # kdenlive.enable = true;
    };
  };
}
