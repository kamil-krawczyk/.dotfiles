{ config, lib, inputs, ... }:

with lib;

let
  configPath = "${builtins.toString inputs.secrets}/home/common/${config.user.profile}/ssh-client-config";
in
{
  config = mkMerge [
    (mkIf (builtins.pathExists configPath) {
      home.file.".ssh/config".text = "${builtins.readFile configPath}";
    })
    {
      programs.ssh = {
        enable = true;
      };
    }
  ];
}
