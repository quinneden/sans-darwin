{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    package = [ pkgs.zed-editor-fhs ];
    extraPackages = with pkgs; [
      nixd
      nil
      starpls
    ];

    mutableUserSettings = true;
    mutableUserKeymaps = true;

    userSettings = import ./settings.nix;
    userKeymaps = import ./keymaps.nix;
  };
}
