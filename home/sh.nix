{ config, lib, ... }:

with lib;

let
  shellAliases = {
    cddf = "z ~/.dotfiles";
    cddl = "z ~/Downloads";
    ga = "git add";
    gbl = "git branch --list";
    gpl = "git pull";
    gps = "git push";
    gst = "git status";
    gsur = "git submodule update --init --recursive";
    l = "eza -la --group-directories-first";
    ll = "eza -glAh --octal-permissions --group-directories-first";
    ls = "eza";
    nhs = "nh search";
    reboot = "sudo systemctl reboot";
    sed = "gsed";
    shutdown = "sudo shutdown now";
  };

  sessionVariables = {
    EDITOR = "nvim";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    LESS = "-RF";
    PAGER = "less";
    # TMPDIR = "/tmp";
  };
in
{
  programs.bash = {
    inherit shellAliases sessionVariables;
    enable = true;
    enableCompletion = true;
    historyFileSize = 10000;
  };

  programs.zsh = {
    inherit shellAliases sessionVariables;
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.path = "${config.programs.zsh.dotDir}/.zsh_history";

    oh-my-zsh = {
      enable = true;
      plugins = [ "colored-man-pages" ];
    };

    completionInit = ''
      autoload -U compinit && compinit
      autoload -U +X bashcompinit && bashcompinit
    '';

    # Common order values:
    #   - 500 (mkBefore): Early initialization (replaces initExtraFirst)
    #   - 550: Before completion initialization (replaces initExtraBeforeCompInit)
    #   - 1000 (default): General configuration (replaces initExtra)
    #   - 1500 (mkAfter): Last to run configuration
    initContent = mkMerge [
      (mkOrder 550 ''
        typeset -U path fpath

        path+=("$HOME/.local/bin" "$HOME/.local/go/bin")

        fpath+=(
          ${optionalString config.nix.enable config.nix.package + "/share/zsh/site-functions"}
          /etc/profiles/per-user/quinn/share/zsh/site-functions
          ${config.xdg.configHome}/zsh/completions
        )
      '')

      (mkOrder 1000 ''
        for f (${config.xdg.configHome}/zsh/{functions,drop-ins}/*(N.)); do
          source "$f"
        done

        [[ -f $HOME/.cargo/env ]] && source "$HOME/.cargo/env"
      '')
    ];
  };
}
