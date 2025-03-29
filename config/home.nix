{ config, pkgs, ... }: {
  home.username = "goose";
  home.stateVersion = "25.05";
    
  imports = [
    ./zsh.home.nix

    ./kitty.home.nix
    ./yazi.home.nix 
  ];  

  programs.home-manager.enable = true;
}
