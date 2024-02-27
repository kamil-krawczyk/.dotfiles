{ config, lib, ... }:
{
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      StreamLocalBindUnlink = "yes";
    };
    banner = "${lib.toUpper config.networking.hostName} welcomes you!\n";
  };
}
