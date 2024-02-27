{ config, lib, hostConfig, ... }:

with lib;

{
  config = mkIf (config.user.git.enable && builtins.elem "macro-system" hostConfig.locations) {
    programs.git =
      {
        extraConfig = {
          url = {
            "ssh://git-server.macro2.local/" = {
              insteadOf = "https://git-server.macro2.local/";
            };
          };
        };
      };
  };
}
