{ config, lib, pkgs, ... }:

with lib;

let
  emails = config.user.emails;
in
{
  config = mkIf (config.user.mail.enable && (config.user.mail.client == "aerc")) {
    home.packages = with pkgs; [
      w3m # Render HTML
      dante # Socksify for rendering HTML
    ];

    programs.aerc = {
      enable = true;

      extraConfig = {
        general.unsafe-accounts-conf = true;
        viewer = {
          pager = "${pkgs.less}/bin/less -R -c";
        };
        filters = {
          "text/plain" = "${pkgs.aerc}/libexec/aerc/filters/colorize";
          "text/calendar" = "${pkgs.gawk}/bin/awk -f ${pkgs.aerc}/libexec/aerc/filters/calendar";
          "text/html" = "${pkgs.aerc}/libexec/aerc/filters/html | ${pkgs.aerc}/libexec/aerc/filters/colorize"; # Requires w3m, dante
          "message/delivery-status" = "${pkgs.aerc}/libexec/aerc/filters/colorize";
          "message/rfc822" = "${pkgs.aerc}/libexec/aerc/filters/colorize";
          "application/x-sh" = "${pkgs.bat}/bin/bat -fP -l sh";
          "application/pdf" = "${pkgs.zathura}/bin/zathura -";
          "audio/*" = "${pkgs.mpv}/bin/mpv -";
          "image/*" = "${pkgs.feh}/bin/feh -";
        };
        ui = {
          threading-enabled = true;
          sidebar-width = 30;
          mouse-enabled = true;
          sort = "-r arrival";
        };
      };

      extraBinds = {
        global = {
          "<C-p>" = ":prev-tab<Enter>";
          "<C-n>" = ":next-tab <Enter>";
          "<C-t>" = ":term<Enter>";
          "?" = ":help keys<Enter>";
        };

        messages = {
          q = ":quit<Enter>";

          j = ":next <Enter>";
          "<Down>" = ":next<Enter>";
          "<C-d>" = ":next 50%<Enter>";
          "<C-f>" = ":next 100%<Enter>";
          "<PgDn>" = ":next 100%<Enter>";

          k = ":prev <Enter>";
          "<Up>" = ":prev<Enter>";
          "<C-u>" = ":prev 50%<Enter>";
          "<C-b>" = ":prev 100%<Enter>";
          "<PgUp>" = ":prev 100%<Enter>";
          g = ":select 0 <Enter>";
          G = ":select -1<Enter>";

          J = ":next-folder <Enter>";
          K = ":prev-folder<Enter>";
          H = ":collapse-folder<Enter>";
          L = ":expand-folder<Enter>";

          v = ":mark -t<Enter>";
          V = ":mark -v<Enter>";

          T = ":toggle-threads<Enter>";

          "<Enter>" = ":view<Enter>";
          d = ":prompt 'Really delete this message?' 'delete-message'<Enter>";
          D = ":move Trash<Enter>";
          A = ":archive year<Enter>";

          C = ":compose<Enter>";

          rr = ":reply -a<Enter>";
          rq = ":reply -aq<Enter>";
          Rr = ":reply<Enter>";
          Rq = ":reply -q<Enter>";

          c = ":cf<space>";
          "$" = ":term<space>";
          "!" = ":term<space>";
          "|" = ":pipe<space>";

          "/" = ":search<space>-a<space>";
          "\\" = ":filter <space>";
          n = ":next-result<Enter>";
          N = ":prev-result<Enter>";
          "<Esc>" = ":clear<Enter>";
        };

        "messages:folder=Drafts" = {
          "<Enter>" = ":recall<Enter>";
        };

        view = {
          "/" = ":toggle-key-passthrough <Enter> /";
          q = ":close<Enter>";
          O = ":open<Enter>";
          S = ":save<space>";
          "|" = ":pipe<space>";
          D = ":move Trash<Enter>";
          A = ":archive year<Enter>";

          "<C-l>" = ":open-link <space>";

          f = ":forward <Enter>";
          rr = ":reply -a<Enter>";
          rq = ":reply -aq<Enter>";
          Rr = ":reply<Enter>";
          Rq = ":reply -q<Enter>";

          H = ":toggle-headers<Enter>";
          "<C-k>" = ":prev-part<Enter>";
          "<C-j>" = ":next-part<Enter>";
          J = ":next <Enter>";
          K = ":prev<Enter>";
        };

        "view::passthrough" = {
          "$noinherit" = "true";
          "$ex" = "<C-x>";
          "<Esc>" = ":toggle-key-passthrough<Enter>";
        };

        compose = {
          # Keybindings used when the embedded terminal is not selected in the compose
          # view
          "$noinherit" = "true";
          "$ex" = "<C-x>";
          "<C-k>" = ":prev-field<Enter>";
          "<C-j>" = ":next-field<Enter>";
          "<A-p>" = ":switch-account -p<Enter>";
          "<A-n>" = ":switch-account -n<Enter>";
          "<tab>" = ":next-field<Enter>";
          "<C-p>" = ":prev-tab<Enter>";
          "<C-n>" = ":next-tab<Enter>";
        };

        "compose::editor" = {
          # Keybindings used when the embedded terminal is selected in the compose view
          "$noinherit" = "true";
          "$ex" = "<C-x>";
          "<C-k>" = ":prev-field<Enter>";
          "<C-j>" = ":next-field<Enter>";
          "<C-p>" = ":prev-tab<Enter>";
          "<C-n>" = ":next-tab<Enter>";
        };

        "compose::review" = {
          # Keybindings used when reviewing a message to be sent
          y = ":send <Enter>";
          n = ":abort<Enter>";
          p = ":postpone<Enter>";
          q = ":choose -o d discard abort -o p postpone postpone<Enter>";
          e = ":edit<Enter>";
          a = ":attach<space>";
          d = ":detach<space>";
        };

        terminal = {
          "$noinherit" = "true";
          "$ex" = "<C-x>";
          "<C-p>" = ":prev-tab<Enter>";
          "<C-n>" = ":next-tab<Enter>";
        };
      };
    };

    accounts.email.accounts = mkMerge
      (lists.forEach emails (email: {
        "${email}" = mkMerge [

          {
            aerc = {
              enable = true;
              extraAccounts = {
                default = "INBOX";
              };
            };
          }

          (mkIf (strings.hasSuffix "gmail.com" email) {
            aerc = {
              extraBinds = {
                messages = {
                  D = ":move [Gmail]/Kosz<Enter>";
                };
                view = {
                  D = ":move [Gmail]/Kosz<Enter>";
                };
              };
            };
          })

        ];
      }));
  };
}
