{ config, pkgs, inputs, ... }:
let
  secretspath = "${builtins.toString inputs.secrets}/hosts/common/macro-system/secrets.yaml";
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  # The password must be stored as a hash, which can be created with the command:
  # echo 'password' | mkpasswd -m sha-512 -s
  sops.secrets."user-passwords/kkrawczyk" = {
    sopsFile = secretspath;
    neededForUsers = true;
  };

  users.users.kkrawczyk = {
    isNormalUser = true;
    description = "Kamil Krawczyk (MCS)";
    shell = pkgs.zsh;
    hashedPasswordFile = config.sops.secrets."user-passwords/kkrawczyk".path;
    extraGroups = [
      "wheel"
      "networkmanager"
    ] ++ ifTheyExist [
      "scanner"
      "lp"
      "docker"
      "libvirtd"
    ];
  };

  home-manager.users.kkrawczyk = import ../../../home/kkrawczyk;
}
