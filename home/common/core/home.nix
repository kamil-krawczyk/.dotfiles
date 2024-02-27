{ config, hostConfig, ... }:
{
  home = {
    homeDirectory = "/home/${config.home.username}";
    stateVersion = hostConfig.stateVersion;
  };

  programs.home-manager.enable = true;
}
