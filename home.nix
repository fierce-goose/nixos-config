{ config, pkgs, ... }: {
  home = {
    username = "goose";
    homeDirectory = "/home/goose";
    stateVersion = "24.05";
  };

  imports = [
    ./bspwm.nix
  ];

  programs.firefox.enable = true;
  
  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch";
      hms = "home-manager switch";
      conf = "sudo nano /etc/nixos/configuration.nix";
    };
  };
}
