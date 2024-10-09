{ config, lib, ... }:

with lib;

{
  config = mkIf (config.host.desktop == "kde-plasma6") {
    services = {
      xserver = {
        enable = true;
        xkb = {
          layout = "pl";
          variant = "";
        };
      };
      displayManager = {
        sddm = {
          enable = true;
          wayland.enable = true;
        };
        defaultSession = "plasma";
      };
      desktopManager.plasma6.enable = true;
    };
  };
}
