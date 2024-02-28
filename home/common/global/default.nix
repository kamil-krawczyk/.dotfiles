{ config, lib, ... }:
{
  imports = [
    # cli
    ./bash.nix
    ./starship.nix
    ./git.nix
    # gui
    ./firefox.nix  
  ];
  
  home = {
    username = lib.mkDefault "kamil";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
