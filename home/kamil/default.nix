{
  imports = [
    ../common
  ];

  home.username = "kamil";
  user = {
    fullName = "Kamil Krawczyk";
    emails = [
      "kamil.krawczyk87@gmail.com"
      "kamil.krawczyk@o2.pl"
    ];

    bundle.office.enable = true;
    bundle.graphic.enable = true;
    bundle.development.enable = true;
    mail.enable = true;
    firefox.enable = true;
    google-chrome.enable = true;
  };
}
