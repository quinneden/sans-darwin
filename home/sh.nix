{
  config,
  inputs,
  lib,
  ...
}:

with lib;

let
  homeDirectory = "/Users/qeden";

  shellAliases = {
    cddf = "z ~/.dotfiles";
    cddl = "z ~/Downloads";
    ga = "git add";
    gbl = "git branch --list";
    gcap = "git commit --amend --no-edit && git push --force";
    gpl = "git pull";
    gps = "git push";
    gst = "git status";
    gsur = "git submodule update --init --recursive";
    l = "eza -la --group-directories-first";
    ll = "eza -glAh --octal-permissions --group-directories-first";
    ls = "eza";
    nhs = "nh search";
    reboot = "sudo reboot";
  };

  sessionVariables = {
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    MICRO_TRUECOLOR = "1";
    NH_FLAKE = "${homeDirectory}/.dotfiles";
    LESS = "-RF";
    PAGER = "less";
    TMPDIR = "/tmp";
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
      autoload -Uz compinit; compinit
      autoload -U +X bashcompinit; bashcompinit
    '';

    # Common order values:
    #   - 500 (mkBefore): Early initialization (replaces initExtraFirst)
    #   - 550: Before completion initialization (replaces initExtraBeforeCompInit)
    #   - 1000 (default): General configuration (replaces initExtra)
    #   - 1500 (mkAfter): Last to run configuration
    initContent = mkMerge [
      (mkOrder 550 ''
        typeset -U path fpath

        path+=(
          "$HOME"/.local/bin(N/)
          "$HOME"/.local/go/bin(N/)
        )

        fpath+=(
          ${config.xdg.configHome}/zsh/completions
          ${config.xdg.configHome}/zsh/functions
          /nix/var/nix/profiles/default/share/zsh/site-functions(N)
          /etc/profiles/per-user/${user}/share/zsh/site-functions
        )

        ZCOMPLETIONS_DIGEST=$ZDOTDIR/completions/.digest.zwc
        ZFUNCTIONS_DIGEST=$ZDOTDIR/functions/.digest.zwc

        if [[ ! -f $ZCOMPLETIONS_DIGEST || $ZCOMPLETIONS_DIGEST -ot $ZDOTDIR/completions(#qN.om[1]) ]]; then
          zcompile $ZCOMPLETIONS_DIGEST $ZDOTDIR/completions/*(N.)
        fi

        if [[ ! -f $ZFUNCTIONS_DIGEST || $ZFUNCTIONS_DIGEST -ot $ZDOTDIR/functions(#qN.om[1]) ]]; then
          zcompile $ZFUNCTIONS_DIGEST $ZDOTDIR/functions/*(N.)
        fi

        autoload -wUz $ZCOMPLETIONS_DIGEST(N)
        autoload -wUz $ZFUNCTIONS_DIGEST(N)
      '')

      (mkOrder 1000 ''
        [[ -f $HOME/.cargo/env ]] && source "$HOME/.cargo/env"
      '')

      (mkOrder 1500 ''
        (
          zcompare() {
            if [[ -s $1 && ( ! -s $1.zwc || $1 -nt $1.zwc) ]]; then
              zcompile $1
            fi
          }

          setopt EXTENDED_GLOB

          zcompare $ZDOTDIR/.zshrc

          for file in $ZDOTDIR/.zcomp^(*.zwc)(N.); do
            zcompare $file
          done

          if [[ $ZFUNCTIONS_DIGEST -ot $ZDOTDIR/functions(#qN.om[1]) ]]; then
            zcompile $ZFUNCTIONS_DIGEST $ZDOTDIR/functions/*(N.)
          fi

          if [[ $ZCOMPLETIONS_DIGEST -ot $ZDOTDIR/completions(#qN.om[1]) ]]; then
            zcompile $ZCOMPLETIONS_DIGEST $ZDOTDIR/completions/*(N.)
          fi
        ) &!

        for file in $ZDOTDIR/drop-ins/*(N.); do
          source $file
        done
      '')
    ];
  };

  home.activation."refreshZwcFiles" = inputs.home-manager.lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    find ${config.xdg.configHome}/zsh -name "*.zwc" -or -name ".zcompdump*" -delete
  '';
}
