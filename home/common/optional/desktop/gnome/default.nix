{ lib, hostConfig, ... }:

with lib;

{
  imports = [ ]
    ++ optionals (hostConfig.desktop == "gnome") [ ./dconf-settings.nix ];
}
