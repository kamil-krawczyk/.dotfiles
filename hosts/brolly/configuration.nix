{ ... }:
{
  imports =
    [
      ./hardware-configuration.nix

      ../common/global

      ../common/users/kamil.nix

      ../common/optional/gnome.nix
      ../common/optional/pipewire.nix
      ../common/optional/cups.nix
    ];

  # Hostname
  networking.hostName = "brolly";

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  boot.initrd.luks.devices."luks-30f7cfe4-e23b-4089-bf18-19c9c30a8711".device = "/dev/disk/by-uuid/30f7cfe4-e23b-4089-bf18-19c9c30a8711";
  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  boot.loader.grub.enableCryptodisk=true;

  boot.initrd.luks.devices."luks-1b981e60-be89-4c3e-a581-d900365de2d3".keyFile = "/crypto_keyfile.bin";
  boot.initrd.luks.devices."luks-30f7cfe4-e23b-4089-bf18-19c9c30a8711".keyFile = "/crypto_keyfile.bin";
}
