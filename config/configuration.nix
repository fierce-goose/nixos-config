# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }: {
  imports =
    [
      ./hardware-configuration.nix
      ./wacom.nix
      ./polkit.nix
      ./nvidia.nix
      ./nvim.nix
    ];

  # Generation label
  system.nixos.label = "";

  # Bootloader
  time.hardwareClockInLocalTime = true;
  boot = {
    loader = {
      grub = {
        enable = true;
        devices = [ "nodev" ];
        useOSProber = true;
        efiSupport = true;
      };
      efi = {
        canTouchEfiVariables = true;
      };
      systemd-boot.enable = false;
    };
    kernelPackages = pkgs.linuxPackages;
    supportedFilesystems = [ "ntfs" ];
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 5900 ];


  # Set your time zone.
  time.timeZone = "America/Vancouver";
  services.ntp.enable = false;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";
  
  # Tuxedo-rs
  hardware.tuxedo-rs = {
    enable = true;
    tailor-gui.enable = true;
  };
  hardware.tuxedo-drivers.enable = true;

  # Hyprland
  programs.hyprland = {
    enable = true;
  };
  
  # Display manager
  services.displayManager = {
    enable = true;
    sddm = {
      enable = true;
      wayland.enable = true;
      settings = {
        Autologin = {
          User = "goose";
          Session = "hyprland";
        };
      };
    };
    defaultSession = "hyprland";
  };
  services.logind.lidSwitchExternalPower = "ignore";

  # Env variables
  environment.variables = {
    # Themes
    GTK_THEME = "Adwaita-dark";
    QT_QPA_PLATFORMTHEME = "gtk3";
  };

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  # Enable all firmware
  hardware.enableAllFirmware = true;

  # Fonts
  fonts = {
    packages = with pkgs; [
      nerd-fonts.symbols-only
    ];
  };
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.goose = {
    isNormalUser = true;
    description = "goose";
    extraGroups = [ "networkmanager" "wheel" "input" "audio" "tty" "dialout" ];
  };

  # Hyprlock
  security.pam.services.hyprlock = {};

  # ZSH  
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
  };

  # File Systems
  fileSystems = {
    "/home" = {
      device = "/dev/nvme0n1p9";
    };
    "/home/goose/sd" = {
      device = "/dev/mmcblk0p1";
      options = [ "rw" ];
    };
    "/home/goose/windows" = {
      device = "/dev/nvme0n1p3";
      fsType = "ntfs";
      options = [ "rw" ];
    };
    "/home/goose/t" = {
      device = "/dev/nvme0n1p5";
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # programs
    neofetch
    cowsay
    git
    firefox
    inputs.ayugram-desktop.packages.${pkgs.system}.ayugram-desktop
    obs-studio
    vlc
    mindustry
    filezilla
    qbittorrent
    hyprpicker
    wofi
    tradingview
    gdu
    tor-browser
    kalker
    vscode
    arduino-ide
    nemo
    grim
    slurp
    obsidian
    feh
    micro
    discord-ptb
    zip
    unzip
    krita
    foliate
    viber

    # system
    home-manager
    busybox
    font-manager
    brightnessctl
    pavucontrol
    btop
    wl-clipboard
    clipse
    gnome-themes-extra
    alsa-utils
    ntfs3g

    # python
    (python3.withPackages(ps: [
        # for esp32
        ps.pyserial
    ]))

    # Nim
    nim
    nimble
  ];

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
