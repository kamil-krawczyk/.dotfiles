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
        gnome.dconf-editor
        gnome.gnome-tweaks
        gnomeExtensions.caffeine
        xsel
      ];
      gnome.excludePackages = with pkgs; [
        epiphany
        gnome.geary
        gnome.gnome-contacts
        gnome.gnome-maps
        gnome.gnome-music
      ];
    };
  };
}
