{
  # The default shell for nix-shell is bash. I want to integrate git with
  # the shell within nix-shell, but I don't want to mess with running zsh
  # to do that. For this reason, I will run bash together with starship.
  programs.starship = {
    enable = true;
    enableZshIntegration = false;
  };
}
