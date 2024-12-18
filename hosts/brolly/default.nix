#=====================================================================#
#                                                                     #
#                            Work desktop                             #
#              Gigabyte B650M DS3H with AMD Ryzen 9 7900              #
#                                                                     #
#=====================================================================#
{ lib, inputs, ... }:
{
  imports =
    [
      # Hardware
      inputs.hardware.nixosModules.common-cpu-amd-pstate
      inputs.hardware.nixosModules.common-gpu-amd
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
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd.luks.devices."luks-2723ddeb-d8fb-49e0-873a-c3f0e71d491b".device = "/dev/disk/by-uuid/2723ddeb-d8fb-49e0-873a-c3f0e71d491b";
  };

  #===================================================================#
  #                              Options                              #
  #===================================================================#

  i18n.defaultLocale = lib.mkForce "en_US.UTF-8";
  host = {
    locations = [ "macro-system" ];
    plymouth.enable = true;
    desktop = "gnome";
    audio.enable = true;
    wireless = {
      enable = true;
      interfaceName = "wlp18s0u1u3";
    };
    vpn.enable = true;
    printing.enable = true;
    scanning.enable = true;
    libvirtd.enable = true;
    virtualbox.enable = true;
    docker.enable = true;
  };
}
