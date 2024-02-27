{
  imports = [
    ../common
  ];

  home.username = "kkrawczyk";
  user = {
    fullName = "Kamil Krawczyk";
    emails = [
      "kkrawczyk@macrosystem.pl"
      "kkrawczyk@macro.local"
    ];
    profile = "macro-system";

    bundle.office.enable = true;
    bundle.graphic.enable = true;
    bundle.development.enable = true;
    mail.enable = true;
    firefox.enable = true;
    google-chrome.enable = true;
  };
}
