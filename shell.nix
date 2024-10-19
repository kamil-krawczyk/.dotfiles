{ pkgs ? import <nixpkgs> { }, ... }: {
  default = pkgs.mkShell {
    NIX_CONFIG = "extra-experimental-features = nix-command flakes";
    nativeBuildInputs = with pkgs; [
      git
      helix

      pciutils
      dmidecode

      home-manager

      sops
      ssh-to-age
      age
    ];
  };
}
