{ lib, ... }:

with lib;

{
  imports = [
    ./wireless_private.nix
    ./wireless_macro-system.nix
  ];

  options.host.wireless = {
    enable = mkEnableOption "";
    interfaceName = mkOption {
      type = types.str;
      default = "wlp2s0";
    };
  };
}
