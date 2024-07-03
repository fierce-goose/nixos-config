{ config, pkgs, ... }: {
  home.username = "goose";
  home.stateVersion = "24.11";
    
  imports = [
    ./bspwm.nix
    ./sxhkd.nix
    ./picom.nix
    ./polybar.nix
    ./yazi.nix
    ./kitty.nix 
  ];  

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      "rebuild" = "sudo nixos-rebuild switch";
    };
  };

  programs.rofi = {
    enable = true;
    theme = "dmenu";
  };

  programs.home-manager.enable = true;
}
