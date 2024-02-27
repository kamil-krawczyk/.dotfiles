{ config, lib, pkgs, ... }:

with lib;

let
  emails = config.user.emails;
in
{
  # config = mkIf (config.user.mail.enable && (config.user.mail.client == "thunderbird")) {
  config = mkIf (config.user.mail.enable) {

    programs.thunderbird = {
      enable = true;
      profiles."Kamil Krawczyk" = {
        isDefault = true;
      };
    };

    accounts.email.accounts = mkMerge
      (lists.forEach emails (email: {
        "${email}" = mkMerge [

          {
            thunderbird = {
              enable = true;
              profiles = [ "Kamil Krawczyk" ];
            };
          }

        ];
      }));
  };
}
