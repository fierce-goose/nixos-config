{ config, pkgs, ... }: {
  home = {
    username = "goose";
    homeDirectory = "/home/goose/";
    stateVersion = "24.11";
  };

  imports = [
    ./autorandr.nix
    ./bspwm.nix
    ./sxhkd.nix
    ./picom.nix
    ./polybar.nix
  ];  
  
  programs.bash = {
    enable = true;
    shellAliases = {
      "rebuild" = "sudo nixos-rebuild switch";
      "hms" = "home-manager switch";
      "configuration.nix" = "sudo nano /etc/nixos/configuration.nix";
      "nvidia.nix" = "sudo nano /etc/nixos/nvidia.nix";
      "home.nix" = "nano ~/.config/home-manager/home.nix";
      "bspwm.nix" = "nano ~/.config/home-manager/bspwm.nix";
      "sxhkd.nix" = "nano ~/.config/home-manager/sxhkd.nix";
      "autorandr.nix" = "nano ~/.config/home-manager/autorandr.nix";
      "picom.nix" = "nano ~/.config/home-manager/picom.nix";
      "polybar.nix" = "nano ~/.config/home-manager/polybar.nix";
      "flake.nix" = "nano ~/.config/home-manager/flake.nix";
    };
  };

  programs.rofi = {
    enable = true;
    theme = "dmenu";
  };
}
