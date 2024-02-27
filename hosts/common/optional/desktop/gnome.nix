{ config, lib, pkgs, ... }:

with lib;

{
  config = mkIf (config.host.desktop == "gnome") {
    services.xserver = {
      enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
      desktopManager.gnome.enable = true;
      xkb = {
        layout = "pl";
        variant = "";
      };
    };

    programs.dconf = {
      enable = true;
    };

    environment = {
      systemPackages = with pkgs; [
        dconf
        dconf-editor
        gnome-tweaks
        gnomeExtensions.caffeine
        xsel
      ];
      gnome.excludePackages = with pkgs; [
        epiphany
        geary
        gnome-contacts
        gnome-maps
        gnome-music
      ];
    };
  };
}
