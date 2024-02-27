#=====================================================================#
#                                                                     #
#                           Private laptop:                           #
#                              MSI GT60                               #
#                                                                     #
#=====================================================================#
{ lib, inputs, ... }:
{
  imports =
    [
      # Hardware
      inputs.hardware.nixosModules.common-cpu-intel
      inputs.hardware.nixosModules.common-gpu-nvidia-disable
      inputs.hardware.nixosModules.common-pc-ssd

      # Required modules
      ./hardware-configuration.nix
      ../common

      # Users
      ../common/users/kamil.nix
    ];

  #===================================================================#
  #                             Hostname                              #
  #===================================================================#

  networking.hostName = "gohan";

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
    initrd.luks.devices."luks-883ee275-1cb9-4428-b971-ff950527ef8b".device = "/dev/disk/by-uuid/883ee275-1cb9-4428-b971-ff950527ef8b";
  };

  #===================================================================#
  #                              Options                              #
  #===================================================================#

  i18n.defaultLocale = lib.mkForce "en_US.UTF-8";
  host = {
    desktop = "gnome";
    audio.enable = true;
    wireless.enable = true;
    printing.enable = true;
    scanning.enable = true;
    libvirtd.enable = true;
    docker.enable = true;
  };
}
