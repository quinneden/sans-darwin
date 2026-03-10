{ pkgs, ... }:
let
  screenshot = pkgs.writers.writeNuBin "screenshot" {
    makeWrapperArgs = with pkgs; [
      "--prefix PATH : ${
        lib.makeBinPath [
          libnotify
          slurp
          wayshot
          swappy
          wl-clipboard
        ]
      }"
    ];
  } (builtins.readFile ../scripts/screenshot.nu);
in
{
  home.packages = with pkgs; [
    bat
    bottom
    eza
    fd
    fzf
    just
    micro
    nodejs
    nodePackages.npm
    pnpm
    ripgrep
    screenshot
    uv
  ];
}
