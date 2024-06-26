{ pkgs, inputs, ... }:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  environment.systemPackages = with pkgs; [
    sops
    age
    ssh-to-age
  ];
}
