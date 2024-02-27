#=====================================================================#
#                                                                     #
#                             Work laptop                             #
#                         Dell Latitude E6320                         #
#                                                                     #
#=====================================================================#
{ lib, inputs, ... }:
{
  imports =
    [
      # Hardware
      inputs.hardware.nixosModules.common-cpu-intel
      inputs.hardware.nixosModules.common-pc-ssd

      # Modules
      ./hardware-configuration.nix
      ../common
      # Hotfix for https://todo.sr.ht/~sircmpwn/aerc2/514
      ../common/optional/security.nix

      # Users
      ../common/users/kkrawczyk.nix
    ];

  #===================================================================#
  #                             Hostname                              #
  #===================================================================#

  networking.hostName = "vegeta";
  networking.enableB43Firmware = true;

  #===================================================================#
  #                           State version                           #
  #===================================================================#

  system.stateVersion = "23.11";

  #===================================================================#
  #                            Bootloader                             #
  #===================================================================#

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd.luks.devices."luks-f14672e6-38c9-4ecc-a1db-2e149222d561".device = "/dev/disk/by-uuid/f14672e6-38c9-4ecc-a1db-2e149222d561";
    kernelParams = [
      "b43.allhwsupport=1"
    ];
  };

  #===================================================================#
  #                              Options                              #
  #===================================================================#

  i18n.defaultLocale = lib.mkForce "en_US.UTF-8";
  host = {
    locations = [ "macro-system" ];
    plymouth.enable = true;
    desktop = "kde-plasma6";
    audio.enable = true;
    wireless = {
      enable = true;
      interfaceName = "wlp2s0b1";
    };
    vpn.enable = true;
    printing.enable = true;
    scanning.enable = true;
    libvirtd.enable = true;
    docker.enable = true;
  };
}
