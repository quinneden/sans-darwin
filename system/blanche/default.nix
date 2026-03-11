{ inputs, self, ... }:

{
  imports = [
    inputs.nixos-apple-silicon.nixosModules.default
    inputs.home-manager.nixosModules.home-manager
    ./audio.nix
    ./hardware.nix
    ./hyprland.nix
    # ./gnome.nix
    ./locale.nix
    ./nautilus.nix
    ./system.nix
  ];

  # gnome.enable = false;

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  nixpkgs = {
    hostPlatform = "aarch64-linux";
    config.allowUnfree = true;
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
    extraSpecialArgs = { inherit inputs self; };
    users.qeden = {
      home.username = "qeden";
      home.homeDirectory = "/home/qeden";
      imports = [ ./home.nix ];
    };
  };
}
