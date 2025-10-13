{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    ags = {
      url = "github:aylur/ags";
    };
    astal = {
      url = "github:aylur/astal";
    };
    battery-notifier = {
      url = "github:aylur/battery-notifier";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };
    home-manager = {
      url = "github:nix-community/home-manager?ref=master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    icon-browser = {
      url = "github:quinneden/icon-browser";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    keys = {
      url = "git+ssh://git@github.com/quinneden/keys";
      flake = false;
    };
    lf = {
      url = "github:gokcehan/lf";
      flake = false;
    };
    marble-kit = {
      url = "git+ssh://git@github.com/marble-shell/kit";
    };
    marble-shell = {
      url = "github:aylur/marble-shell";
      inputs.sshKey.follows = "sshKey";
    };
    nix-search = {
      url = "github:aylur/nix-search";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-apple-silicon = {
      url = "github:nix-community/nixos-apple-silicon";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sshKey = {
      url = "git+ssh://git@github.com/quinneden/keys?dir=ssh/qe-mbp/id_ed25519";
      flake = false;
    };
    # secrets = {
    #   url = "git+ssh://git@github.com:quinneden/secrets";
    #   inputs = { };
    # };
  };

  outputs =
    { nixpkgs, self, ... }@inputs:

    let
      system = "aarch64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        # overlays = [ self.overlays.default ];
      };
    in

    {
      nixosConfigurations = {
        "nixos" = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs self; };
          modules = [ ./system/nixos ];
        };
      };

      overlays = import ./pkgs/overlay.nix { inherit inputs; };

      packages.${system} = { inherit (pkgs) marble-shell; };
    };
}
