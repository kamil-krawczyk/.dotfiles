{ config, lib, inputs, ... }:

with lib;

let
  userName = config.home.username;
  fullName = config.user.fullName;
  userEmail = builtins.head config.user.emails;
in
{
  imports = [
    ./git_none-kamil.nix
    ./git_macro-system.nix
  ];

  options.user.git.enable = mkEnableOption "";

  config = mkIf config.user.git.enable {
    home.file.".ssh/allowed_signers".text = "${userEmail} namespaces=\"git\" ${builtins.readFile "${inputs.self}/home/${userName}/id_ed25519.pub"}";

    programs.git =
      {
        enable = true;
        userName = fullName;
        userEmail = userEmail;
        # https://jeppesen.io/git-commit-sign-nix-home-manager-ssh/
        extraConfig = {
          # Sign all commits using ssh key
          commit.gpgsign = true;
          gpg.format = "ssh";
          gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
          user.signingkey = "~/.ssh/id_ed25519.pub";
        };
      };
  };
}
