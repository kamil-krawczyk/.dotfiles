#=====================================================================#
#                                                                     #
#                          Private laptop:                            #
#                  Lenovo Yoga 520-14IKB (Type 81C8)                  #
#                                                                     #
#=====================================================================#
{ lib, inputs, ... }:
{
  imports =
    [
      # Hardware
      inputs.hardware.nixosModules.common-cpu-intel
      inputs.hardware.nixosModules.common-pc-ssd

      # Required modules
      ./hardware-configuration.nix
      ../common

      # Users
      ../common/users/kamil.nix
      ../common/users/kkrawczyk.nix
    ];

  #===================================================================#
  #                             Hostname                              #
  #===================================================================#

  networking.hostName = "goku";

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
    initrd.luks.devices."luks-7c29b02d-a4a5-4877-93b0-f4911aab7739".device = "/dev/disk/by-uuid/7c29b02d-a4a5-4877-93b0-f4911aab7739";
  };

  #===================================================================#
  #                              Options                              #
  #===================================================================#

  i18n.defaultLocale = lib.mkForce "en_US.UTF-8";
  host = {
    locations = [ "private" "macro-system" ];
    desktop = "gnome";
    audio.enable = true;
    wireless.enable = true;
    vpn.enable = true;
    printing.enable = true;
    scanning.enable = true;
    libvirtd.enable = true;
    docker.enable = true;
  };
}
