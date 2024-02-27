{ pkgs, ... }:
{
  users.defaultUserShell = pkgs.zsh;
  environment.shells = [ pkgs.zsh ];
  programs.zsh.enable = true;
}
