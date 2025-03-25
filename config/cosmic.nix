{ config, pkgs, ... }: {
  services = {
    desktopManager.cosmic.enable = true;
    displayManager.cosmic-greeter.enable = true;
  };
  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
  # boot.kernelParams = [ "nvidia_drm.fbdev=1" ];
}
