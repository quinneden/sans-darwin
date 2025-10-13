{ pkgs, ... }:
{
  # nix
  documentation.nixos.enable = false;

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
    warn-dirty = false;
    trusted-users = [ "quinn" ];
  };

  # virtualisation
  programs.virt-manager.enable = true;
  virtualisation = {
    podman.enable = true;
    docker.enable = true;
    libvirtd.enable = true;
  };

  # dconf
  programs.dconf.enable = true;

  # packages
  environment.systemPackages = with pkgs; [
    # asahi-bless
    # asahi-btsync
    # asahi-fwextract
    home-manager
    neovim
    git
    wget
    firefox
    chromium
  ];

  # services
  services = {
    xserver = {
      enable = false;
      excludePackages = [ pkgs.xterm ];
    };
    sysprof.enable = true;
    printing.enable = false;
    flatpak.enable = true;
  };

  # ssh
  services.openssh.enable = true;
  programs.ssh.startAgent = true;

  # network
  networking = {
    hostName = "nixos-macmini";
    networkmanager.enable = true;
  };

  # bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General.Experimental = true; # bluetooth percentage
  };

  # swap
  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };

  # asahi
  # hardware.asahi = {
  #   setupAsahiSound = true;
  #   peripheralFirmwareDirectory = pkgs.fetchzip {
  #     url = "https://f.qeden.me/fw/asahi-firmware-20250422.tgz";
  #     hash = "sha256-UfWioh4/GWiXxTLjomrYPYgPYSHKvyVsiZwc1ml8vuM=";
  #     stripRoot = false;
  #   };
  # };

  # bootloader
  boot = {
    bootspec.enable = true;
    consoleLogLevel = 0;
    initrd.verbose = false;
    tmp.cleanOnBoot = true;
    loader = {
      timeout = 1;
      systemd-boot.enable = true;
      # efi.canTouchEfiVariables = false;
      efi.canTouchEfiVariables = true;
    };

    # m1n1CustomLogo = pkgs.fetchurl {
    #   url = "https://f.qeden.me/bootlogo-snowflake-white.png";
    #   hash = "sha256-6VpPDZSYD57m4LZRPQuOWtR7z70BQ0A2f2jZgjXDiKs=";
    # };

    kernelParams = [
      "quiet"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "splash"
      "udev.log_priority=3"
    ];
  };

  security.sudo.wheelNeedsPassword = false;

  system.stateVersion = "25.11";
}
