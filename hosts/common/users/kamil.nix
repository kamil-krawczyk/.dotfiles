{ pkgs, ... }:
{
  users.users.kamil = {
    isNormalUser = true;
    description = "Kamil Krawczyk";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  home-manager.users.kamil = import ../../../home/users/kamil.nix;
}
