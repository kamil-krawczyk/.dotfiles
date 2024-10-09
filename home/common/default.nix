{ lib, ... }:

with lib;

{
  imports = [
    # core (profile)
    ./core/bash.nix
    ./core/helix.nix
    ./core/home.nix
    ./core/misc.nix
    ./core/ssh.nix
    ./core/starship.nix
    ./core/tmux.nix
    ./core/zsh.nix

    # optional (toggleable)
    ./optional/bundles/development.nix
    ./optional/bundles/graphic.nix
    ./optional/bundles/office.nix
    ./optional/desktop/gnome
    ./optional/direnv.nix
    ./optional/evince.nix
    ./optional/firefox.nix
    ./optional/gimp.nix
    ./optional/git
    ./optional/google-chrome.nix
    ./optional/imagemagick.nix
    ./optional/inkscape.nix
    ./optional/kdenlive.nix
    ./optional/libreoffice.nix
    ./optional/mail
    ./optional/misc.nix
    ./optional/virt-manager.nix
  ];

  options.user = {
    fullName = mkOption {
      type = types.str;
      default = "";
    };
    emails = mkOption {
      type = types.listOf types.str;
      default = [ ];
    };
    profile = mkOption {
      type = types.str;
      default = "private";
    };
  };
}
