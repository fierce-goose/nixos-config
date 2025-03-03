{ config, pkgs, ... }: {
  services = {
    desktopManager.cosmic.enable = true;
    displayManager.cosmic-greeter.enable = true;

    xserver.xkb = {
      layout = "us,ru";
      options = "grp:win_space_toggle";
    };
  };
  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
  boot.kernelParams = [ "nvidia_drm.fbdev=1" ];
}
