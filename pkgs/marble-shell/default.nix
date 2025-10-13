{
  ags,
  fetchFromGitHub,
  git,
  gobject-introspection,
  inputs,
  marbleSetupHook,
  openssh,
  pnpm,
  stdenv,
  wrapGAppsHook4,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "marble-shell";
  version = (builtins.fromJSON (builtins.readFile (finalAttrs.src + "/package.json"))).version;

  src = fetchFromGitHub {
    owner = "aylur";
    repo = "marble-shell";
    rev = "";
    hash = "sha256-c9K1r9yRNNMnKQ+HkQBGqvGLUwy6O2Ji+ZV8NhtK7ww=";
  };

  pnpmDeps = pnpm.fetchDeps {
    inherit (finalAttrs) pname src;
    buildInputs = [
      git
      openssh
    ];
    fetcherVersion = 2;
    hash = "sha256-c3f/I/0gZ4Aqm1TCUA9CJEr21r3RFjBigaFCNKiC7ek=";
    sshKey = inputs.keys + "/ssh/qe-mbp/id_ed25519";
    prePnpmInstall = ''
      tmpKey=$(mktemp)
      trap "rm -f $tmpKey" EXIT
      cat $sshKey > $tmpKey
      chmod 600 $tmpKey
      eval $(ssh-agent -s) 2>/dev/null
      ssh-add $tmpKey
      export GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no"
    '';
  };

  nativeBuildInputs = [
    wrapGAppsHook4
    gobject-introspection
    pnpm.configHook
    marbleSetupHook
    ags
    git
  ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    mv data $out/share
    ags bundle app.ts $out/bin/marble -d "import.meta.PKG_DATADIR='$out/share'"
    runHook postInstall
  '';
})
