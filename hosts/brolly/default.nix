#=====================================================================#
#                                                                     #
#                            Work desktop                             #
#                          Dell OptiPlex 780                          #
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

  networking.hostName = "brolly";

  #===================================================================#
  #                           State version                           #
  #===================================================================#

  system.stateVersion = "23.11";

  #===================================================================#
  #                            Bootloader                             #
  #===================================================================#

  boot = {
    loader.grub = {
      enable = true;
      device = "/dev/sda";
      useOSProber = true;
      enableCryptodisk = true;
    };
    initrd = {
      secrets = { "/crypto_keyfile.bin" = null; };
      luks.devices = {
        "luks-30f7cfe4-e23b-4089-bf18-19c9c30a8711".device = "/dev/disk/by-uuid/30f7cfe4-e23b-4089-bf18-19c9c30a8711";
        "luks-1b981e60-be89-4c3e-a581-d900365de2d3".keyFile = "/crypto_keyfile.bin";
        "luks-30f7cfe4-e23b-4089-bf18-19c9c30a8711".keyFile = "/crypto_keyfile.bin";
      };
    };
  };

  #===================================================================#
  #                              Options                              #
  #===================================================================#

  i18n.defaultLocale = lib.mkForce "en_US.UTF-8";
  host = {
    locations = [ "macro-system" ];
    desktop = "gnome";
    audio.enable = true;
    wireless = {
      enable = true;
      interfaceName = "wlp0s26f7u2";
    };
    vpn.enable = true;
    printing.enable = true;
    scanning.enable = true;
    libvirtd.enable = true;
    docker.enable = true;
  };
}
