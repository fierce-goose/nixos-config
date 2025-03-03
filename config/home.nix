{ config, pkgs, ... }: {
  home.username = "goose";
  home.stateVersion = "25.05";
    
  imports = [
    ./zsh.nix

    ./kitty.nix
    ./yazi.nix 
  ];  

  programs.home-manager.enable = true;
}
