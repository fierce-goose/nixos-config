{ config, pkgs, ... }: {
  services.dunst = {
    enable = true;

    settings = {
      global = {
        monitor = "eDP-1";
        follow = "none";
      };
    };
  };
}
