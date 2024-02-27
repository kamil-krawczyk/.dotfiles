{
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "libtiff-4.0.3-opentoonz"
    ];
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    gc = {
      automatic = true;
      persistent = true;
      options = "--delete-older-than 14d";
    };
  };
}
