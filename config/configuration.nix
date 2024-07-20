# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Generation label
  system.nixos.label = "";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Vancouver";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";
  
  hardware.tuxedo-rs = {
    enable = true;
    tailor-gui.enable = true;
  };
  
  services.xserver.videoDrivers = [ "intel" "nouveau" ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  programs.hyprland = {
    enable = true;
  };
  
  services.displayManager = {
    enable = true;
    sddm = {
      enable = true;
      wayland.enable = true;
    };
    defaultSession = "hyprland";
  };

  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
  };

  fonts = {
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];
  };
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.goose = {
    isNormalUser = true;
    description = "goose";
    extraGroups = [ "networkmanager" "wheel" "input" "audio" ];
  };
  
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #programs
    neofetch
    cowsay
    git
    firefox
    telegram-desktop
    obs-studio
    vlc
    mpd
    mindustry
    filezilla
    qbittorrent
    hyprpicker
    wofi
    wofi-emoji

    #system
    home-manager
    lshw
    busybox
    font-manager
    brightnessctl
    pavucontrol
    btop
    wl-clipboard

    #python
    (python3.withPackages(ps: with ps; [
      
    ]))
  ];


  #virtualbox
  #virtualisation.virtualbox.host.enable = true;
  #virtualisation.virtualbox.host.enableExtensionPack = true;
  #virtualisation.virtualbox.guest.enable = true;

  # Auto-delete generations
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Flakes support
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
