{ inputs, self, ... }:

{
  imports = [
    # inputs.nixos-apple-silicon.nixosModules.default
    inputs.home-manager.nixosModules.home-manager
    # ./hardware.nix
    # ./audio.nix
    ./gnome.nix
    ./hyprland.nix
    ./locale.nix
    ./nautilus.nix
    ./niri.nix
    ./system.nix
  ];

  gnome.enable = true;
  hyprland.enable = true;
  # niri.enable = true;

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  nixpkgs = {
    hostPlatform = "aarch64-linux";
    config.allowUnfree = true;
    # overlays = [ self.overlays.default ];
  };

  users.users.quinn = {
    isNormalUser = true;
    initialPassword = "cbro";
    extraGroups = [
      "nixosvmtest"
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "libvirtd"
      "docker"
    ];
  };

  home-manager = {
    backupFileExtension = "hm.bck";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.quinn = {
      home.username = "quinn";
      home.homeDirectory = "/home/quinn";
      imports = [ ./home.nix ];
    };
  };
}
