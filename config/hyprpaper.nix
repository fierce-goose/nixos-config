{ config, pkgs, ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/wallpapers/5.jpg" ];
      wallpaper = [
        "eDP-1, ~/wallpapers/5.jpg"
        "HDMI-A-1, ~/wallpapers/5.jpg"
      ];
    };
  };
}
