{ config, lib, inputs, ... }:

with lib;

let
  emails = config.user.emails;
  primaryEmail = builtins.head emails;
  setFlavor = email:
    if (strings.hasSuffix "gmail.com" email) then
      "gmail.com"
    else "plain";
in
{
  imports = [
    ./aerc.nix
    ./thunderbird.nix
  ];

  options.user.mail = {
    enable = mkEnableOption "";
    client = mkOption {
      type = types.str;
      default = "aerc";
    };
  };

  config = mkIf config.user.mail.enable {
    accounts.email.accounts = mkMerge
      (lists.forEach emails (email: {
        "${email}" = mkMerge [
          {
            address = "${email}";
            realName = "${config.user.fullName}";
            primary = ("${email}" == "${primaryEmail}");
            passwordCommand = "sops --extract '[\"emails\"][\"${email}\"]' --decrypt ${builtins.toString inputs.secrets}/home/${config.home.username}/secrets.yaml";
            flavor = setFlavor email;
          }

          (mkIf (strings.hasSuffix "o2.pl" email) {
            userName = email;
            imap = {
              host = "poczta.o2.pl";
              port = 993;
              tls.enable = true;
            };
            smtp = {
              host = "poczta.o2.pl";
              port = 465;
              tls.enable = true;
            };
          })

          (mkIf (strings.hasSuffix "macrosystem.pl" email) {
            userName = email;
            imap = {
              host = "mail.macrosystem.pl";
              port = 993;
              tls.enable = true;
            };
            smtp = {
              host = "mail.macrosystem.pl";
              port = 587;
              tls = {
                enable = true;
                useStartTls = true;
              };
            };
          })

          (mkIf (strings.hasSuffix "macro.local" email) {
            userName = email;
            imap = {
              host = "zimbra8.macro.local";
              port = 7993;
              tls.enable = true;
            };
            smtp = {
              host = "zimbra8.macro.local";
              port = 465;
              tls.enable = true;
            };
          })
        ];
      }));
  };
}
