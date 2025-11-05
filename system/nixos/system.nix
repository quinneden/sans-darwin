{ pkgs, ... }:
{
  # nix
  documentation.nixos.enable = false;

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
    warn-dirty = false;
    trusted-users = [ "qeden" ];
  };

  # virtualisation
  # programs.virt-manager.enable = true;
  virtualisation = {
    podman = {
      enable = true;
      dockerSocket.enable = true;
    };
    # docker.enable = true;
    # libvirtd.enable = true;
  };

  # dconf
  programs.dconf.enable = true;

  # packages
  environment.systemPackages = with pkgs; [
    asahi-audio
    asahi-bless
    asahi-btsync
    asahi-fwextract
    asahi-wifisync
    chromium
    firefox
    git
    home-manager
    neovim
    wget
  ];

  # services
  services = {
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
    };
    libinput.enable = true;
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
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
    wireless.enable = false;
    wireless.iwd = {
      enable = true;
      settings.General.EnableNetworkConfiguration = true;
    };
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
  hardware.asahi = {
    setupAsahiSound = true;
    extractPeripheralFirmware = true;
    peripheralFirmwareDirectory = pkgs.fetchzip {
      url = "https://f.qeden.me/fw/asahi-fw-m2-20251102.tgz";
      hash = "sha256-ZKQeq3tHQob1b0YavuA/Akyjo5ftkXhw1WTwaZSvY7M=";
    };
  };

  # bootloader
  boot = {
    bootspec.enable = true;
    consoleLogLevel = 0;
    initrd.verbose = false;
    tmp.cleanOnBoot = true;
    loader = {
      timeout = 1;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = false;
    };

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
