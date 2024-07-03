# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./nvidia.nix
      ./autorandr.nix
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

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };

  fonts = {
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];
  };

  # Configure X11
  services.xserver = {
    enable = true;
    exportConfiguration = true;
    
    xkb.layout = "us,ru";
    xkb.options = "grp:win_space_toggle";
    
    windowManager.bspwm.enable = true; 
  };

  services.displayManager = {
    defaultSession = "none+bspwm";
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
    git
    lxappearance
    firefox
    telegram-desktop
    gpick
    flameshot
    obs-studio
    vlc
    mindustry
    filezilla
    lftp
    
    #system
    home-manager
    lshw
    busybox
    font-manager
    xorg.xev
    xorg.xwininfo
    brightnessctl
    rofi-power-menu
    pavucontrol

    #python
    (python3.withPackages(ps: with ps; [
      
    ]))
  ];

  #virtualbox
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  virtualisation.virtualbox.guest.enable = true;

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
