{
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
        "repl-flake"
      ];
    };
    gc = {
      automatic = true;
      persistent = true;
      options = "--delete-older-than 14d";
    };
  };
}
