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
    ../../home/packages.nix
    ../../home/sh.nix
    ../../home/starship.nix
    ../../home/theme.nix
    ../../home/zed
  ];

  manual.manpages.enable = false;

  news.display = "show";

  home = {
    sessionPath = [ "${config.home.homeDirectory}/.local/bin" ];
    sessionVariables = {
      BAT_THEME = "base16";
      PAGER = "${pkgs.bat}/bin/bat --style=plain";
    };
  };

  xdg.configFile."gtk-4.0/bookmarks".text =
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
  home.stateVersion = "26.05";
}
