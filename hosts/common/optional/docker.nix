{ config, lib, ... }:

with lib;

{
  options.host.docker.enable = mkEnableOption "";

  config = mkIf config.host.docker.enable {
    virtualisation.docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };

    # Ensure group exists
    users.groups = {
      docker = { };
    };
  };
}
