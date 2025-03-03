{ config, pkgs, ... }: {
  services = {
    xserver.enable = true;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    desktopManager.plasma6.enable = true;
  };
  boot.kernelParams = [ "nvidia_drm.fbdev=1" ];
}
