{ lib, ... }:

with lib;

{
  imports = [
    ./vpn_macro-system.nix
  ];

  options.host.vpn.enable = mkEnableOption "";
}
