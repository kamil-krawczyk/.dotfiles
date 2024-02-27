{ config, lib, pkgs, ... }:

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

    environment.systemPackages = with pkgs; [
      kdePackages.bluedevil
      kdePackages.bluez-qt
      bluez
      bluez-alsa
      bluez-tools
    ];

  };
}
