{ config, lib, ... }:

with lib;

{
  imports = [
    # core (profile)
    ./core/auto-upgrade.nix
    ./core/boot.nix
    ./core/helix.nix
    ./core/home-manager.nix
    ./core/locale.nix
    ./core/misc.nix
    ./core/networking.nix
    ./core/nix.nix
    ./core/openssh.nix
    ./core/sops.nix
    ./core/zsh.nix

    # optional (toggleable)
    ./optional/audio.nix
    ./optional/desktop
    ./optional/desktop/gnome.nix
    ./optional/desktop/kde-plasma6.nix
    ./optional/docker.nix
    ./optional/libvirtd.nix
    ./optional/plymouth.nix
    ./optional/printing.nix
    ./optional/scanning.nix
    ./optional/vpn
    ./optional/wireless
  ];

  options.host = {
    stateVersion = mkOption {
      type = types.str;
      default = config.system.stateVersion;
    };
    locations = mkOption {
      type = types.listOf types.str;
      default = [ "private" ];
    };
  };
}
