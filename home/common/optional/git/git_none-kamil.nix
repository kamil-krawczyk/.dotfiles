{ config, lib, inputs, ... }:

with lib;

let
  userEmail = builtins.head config.user.emails;
in
{
  config = mkIf (config.user.git.enable && userEmail != "kamil.krawczyk87@gmail.com") {
    home.file.".gitconfig.private".text = "[user]\n\tname = \"Kamil Krawczyk\"\n\temail = \"kamil.krawczyk87@gmail.com\"\n";

    programs.git =
      {
        includes = [
          {
            condition = "gitdir:~/.dotfiles/";
            path = "~/.gitconfig.private";
          }
          {
            condition = "gitdir:~/.secrets/";
            path = "~/.gitconfig.private";
          }
        ];
      };
  };
}
