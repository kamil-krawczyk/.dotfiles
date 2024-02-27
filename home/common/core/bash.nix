{ config, ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = config.programs.zsh.shellAliases;
  };
}
