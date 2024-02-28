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
  networking.hostName = "goku";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-7c29b02d-a4a5-4877-93b0-f4911aab7739".device = "/dev/disk/by-uuid/7c29b02d-a4a5-4877-93b0-f4911aab7739";
}
