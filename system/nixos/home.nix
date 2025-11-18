{ config, pkgs, ... }:
{
  imports = [
    ../../home/browser.nix
    ../../home/dconf.nix
    ../../home/distrobox
    ../../home/ghostty.nix
    ../../home/git.nix
    ../../home/hyprland.nix
    ../../home/lf.nix
    # ../../home/nvim.nix
    ../../home/packages.nix
    ../../home/sh.nix
    ../../home/starship.nix
    ../../home/theme.nix
    # ../../home/tmux.nix
  ];

  manual.manpages.enable = false;

  news.display = "show";

  home = {
    sessionVariables = {
      # NIXPKGS_ALLOW_UNFREE = "1";
      # NIXPKGS_ALLOW_INSECURE = "1";
      BAT_THEME = "base16";
      PAGER = "${pkgs.bat}/bin/bat --style=plain";
      # GOPATH = "${config.home.homeDirectory}/.local/share/go";
      # GOMODCACHE = "${config.home.homeDirectory}/.cache/go/pkg/mod";
    };

    sessionPath = [ "${config.home.homeDirectory}/.local/bin" ];
  };

  xdg.configFile."gtk-3.0/bookmarks".text =
    let
      home = config.home.homeDirectory;
    in
    ''
      file://${home}/Desktop
      file://${home}/Documents
      file://${home}/Downloads
      file://${home}/Pictures
      file://${home}/src Src
      file://${home}/Videos
      file://${home}/workdir Workdir
    '';

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
