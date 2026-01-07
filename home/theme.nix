{ pkgs, config, ... }:
{
  home = {
    packages = with pkgs; [
      adw-gtk3
      morewaita-icon-theme
      nerd-fonts.victor-mono
      nerd-fonts.ubuntu
      papirus-icon-theme
      phinger-cursors
      qogir-icon-theme
      yaru-theme
    ];
  };

  fonts.fontconfig.enable = true;

  home.file.".local/share/flatpak/overrides/global".text =
    let
      dirs = [
        "/nix/store:ro"
        "xdg-config/gtk-3.0:ro"
        "xdg-config/gtk-4.0:ro"
        "${config.xdg.dataHome}/icons:ro"
      ];
    in
    ''
      [Context]
      filesystems=${builtins.concatStringsSep ";" dirs}
    '';
}
