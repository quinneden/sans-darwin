{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    battery-notifier = {
      url = "github:aylur/battery-notifier";
      inputs.nixpkgs.follows = "nixpkgs";
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
    marble = {
      url = "git+ssh://git@github.com/marble-shell/kit";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    marble-shell = {
      url = "git+ssh://git@github.com/quinneden/marble-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.marble.follows = "marble";
    };
    nix-search = {
      url = "github:aylur/nix-search";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-apple-silicon = {
      url = "github:nix-community/nixos-apple-silicon";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, self, ... }@inputs:
    {
      nixosConfigurations = {
        "blanche" = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs self; };
          modules = [ ./system/blanche ];
        };
      };
    };
}
