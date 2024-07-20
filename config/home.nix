{ config, pkgs, ... }: {
  home.username = "goose";
  home.stateVersion = "24.11";
    
  imports = [
    ./zsh.nix

    ./hyprland.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./waybar.nix

    ./kitty.nix
    ./yazi.nix 
  ];  

  programs.home-manager.enable = true;
}
