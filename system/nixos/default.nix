{ inputs, ... }:

{
  imports = [
    inputs.nixos-apple-silicon.nixosModules.default
    inputs.home-manager.nixosModules.home-manager
    ./hardware.nix
    ./gnome.nix
    ./hyprland.nix
    ./locale.nix
    ./nautilus.nix
    ./niri.nix
    ./system.nix
  ];

  gnome.enable = true;
  hyprland.enable = true;
  niri.enable = false;

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  nixpkgs = {
    hostPlatform = "aarch64-linux";
    config.allowUnfree = true;
    # overlays = [ self.overlays.default ];
  };

  users.users.qeden = {
    isNormalUser = true;
    extraGroups = [
      "nixosvmtest"
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "input"
    ];
  };

  home-manager = {
    backupFileExtension = "hm.bck";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.qeden = {
      home.username = "qeden";
      home.homeDirectory = "/home/qeden";
      imports = [ ./home.nix ];
    };
  };
}
