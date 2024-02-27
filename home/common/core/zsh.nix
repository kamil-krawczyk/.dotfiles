{ config, lib, ... }:

with lib;

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "fino-time";
      plugins = [
        "history"
      ]
      ++ optionals config.programs.git.enable [
        "git-prompt"
        "gitignore"
      ]
      ++ optional config.programs.direnv.enable "direnv";
    };
    shellAliases = mkMerge [
      {
        # lists everything with directories first
        l = "eza --group-directories-first --color=always";
        ls = "eza --group-directories-first --color=always";
        # lists (long) everything with directories first
        ll = "eza -l --group-directories-first --color=always";
        # lists everything with hidden and directories first
        la = "eza -la --group-directories-first --color=always";
        # lists only hidden with directories first
        lh = "eza -ld .* --group-directories-first --color=always";
        # lists only directories (no files)
        ld = "eza -lD --color=always";
        # lists only files (no directories)
        lf = "eza -lf --color=always | grep -v /";
        # lists everything in form of tree
        lt = "eza -T --group-directories-first --color=always";
      }
      (mkIf config.programs.aerc.enable {
        a = "aerc";
      })
    ];
  };
}
