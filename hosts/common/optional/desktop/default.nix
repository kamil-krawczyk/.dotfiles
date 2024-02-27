{ lib, ... }:

with lib;

{
  options.host.desktop = mkOption {
    type = types.str;
    default = "none";
  };
}
