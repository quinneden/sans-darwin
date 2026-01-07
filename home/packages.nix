{ pkgs, inputs, ... }:
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

  lorem = pkgs.writers.writeNuBin "lorem" { } (builtins.readFile ../scripts/lorem.nu);

  gjs-wrapped = pkgs.stdenv.mkDerivation {
    name = "gjs";
    src = null;
    dontUnpack = true;
    nativeBuildInputs = with pkgs; [ wrapGAppsHook4 ];
    buildInputs = with pkgs; [
      gjs
      glib
      libsoup_3
      gtk4
      gtk3
      gtk4-layer-shell
      gtk-layer-shell
      libadwaita
      gobject-introspection
    ];
    installPhase = ''
      mkdir -p $out/bin
      cp ${pkgs.gjs}/bin/gjs $out/bin/gjs
    '';
  };

  python-wrapped =
    let
      python = pkgs.python3.withPackages (p: [
        p.requests
        p.pygobject3
      ]);
    in
    pkgs.stdenv.mkDerivation {
      name = "python";
      src = null;
      dontUnpack = true;
      nativeBuildInputs = with pkgs; [ wrapGAppsHook4 ];
      buildInputs = with pkgs; [
        python
        glib
        libsoup_3
        gtk4
        gtk3
        gtk4-layer-shell
        gtk-layer-shell
        libadwaita
        gobject-introspection
      ];
      installPhase = ''
        mkdir -p $out/bin
        cp ${python}/bin/python3 $out/bin/python
      '';
    };
in
{
  home.packages = with pkgs; [
    (mpv.override { scripts = [ mpvScripts.mpris ]; })
    bat
    btop
    esbuild
    eza
    fd
    fragments
    fzf
    gjs-wrapped
    inputs.icon-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.nix-search.packages.${pkgs.stdenv.hostPlatform.system}.default
    just
    lazydocker
    lazygit
    lorem
    micro
    nodejs
    nodePackages.npm
    pnpm
    python-wrapped
    ripgrep
    screenshot
    uv
  ];
}
