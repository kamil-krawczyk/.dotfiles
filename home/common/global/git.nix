{ pkgs, lib, ... }:
{
  programs.git = {
    enable = true;
    userName = lib.mkDefault "Kamil Krawczyk";
    userEmail = lib.mkDefault "kamil.krawczyk87@gmail.com";
  };
}
