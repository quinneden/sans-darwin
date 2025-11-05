{ config, lib, ... }:

let
  shellAliases = {
    cd = "z";
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
    shutdown = "sudo systemctl poweroff";
  };

  sessionVariables = {
    EDITOR = "micro";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    LESS = "-RF";
    TMPDIR = "/tmp";
    NH_FLAKE = "${config.home.homeDirectory}/.dotfiles";
  };
in
{
  programs.bash = {
    inherit shellAliases sessionVariables;
    enable = true;
    enableCompletion = true;
    historyFileSize = 10000;
  };

  programs.zoxide.enable = true;

  programs.zsh = {
    inherit shellAliases sessionVariables;
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.path = "${config.programs.zsh.dotDir}/.zsh_history";

    # oh-my-zsh = {
    #   enable = true;
    #   plugins = [ "colored-man-pages" ];
    # };

    completionInit = ''
      zstyle ':completion:*' menu select
      autoload -U compinit && compinit
      autoload -U +X bashcompinit && bashcompinit
    '';

    # Common order values:
    #   - 500 (mkBefore): Early initialization (replaces initExtraFirst)
    #   - 550: Before completion initialization (replaces initExtraBeforeCompInit)
    #   - 1000 (default): General configuration (replaces initExtra)
    #   - 1500 (mkAfter): Last to run configuration
    initContent =
      with lib;
      mkMerge [
        (mkOrder 550 ''
          unsetopt BEEP

          typeset -U path fpath

          path+=("$HOME"/.local/bin(N/) "$HOME"/.local/go/bin(N/))

          fpath+=(
            ${optionalString config.nix.enable config.nix.package + "/share/zsh/site-functions"}
            /etc/profiles/per-user/qeden/share/zsh/site-functions
            ${config.xdg.configHome}/zsh/completions
            ${config.xdg.configHome}/zsh/functions
          )
        '')

        (mkOrder 1000 ''
          bindkey "^[[1;5C" forward-word
          bindkey "^[[1;5D" backward-word

          [[ -f $HOME/.cargo/env ]] && source "$HOME/.cargo/env"
        '')

        (mkOrder 1500 ''
          (
            # Function to determine the need of a zcompile. If the .zwc file
            # does not exist, or the base file is newer, we need to compile.
            # These jobs are asynchronous, and will not impact the interactive shell
            zcompare() {
              if [[ -s $1 && ( ! -s $1.zwc || $1 -nt $1.zwc) ]]; then
                zcompile $1
              fi
            }

            setopt EXTENDED_GLOB

            # zcompile the completion cache; siginificant speedup.
            for file in $ZDOTDIR/.zcomp^(*.zwc)(.); do
              zcompare $file
            done

            # zcompile .zshrc
            zcompare $ZDOTDIR/.zshrc

            # zcompile all .zsh files in the custom module
            for file in $ZDOTDIR/functions/^(*.zwc)(.); do
              zcompare $file
            done

            for file in $ZDOTDIR/drop-ins/^(*.zwc)(.); do
              zcompare $file
            done
          ) &!

          autoload -wUz ~/.config/zsh/functions/*.zwc(N.:r)
        '')
      ];
  };
}
