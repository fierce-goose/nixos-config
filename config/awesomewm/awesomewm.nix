{ config, pkgs, ... }: {
  services = {
    xserver = {
      enable = true;

      windowManager.awesome = {
        enable = true;
        luaModules = with pkgs.luaPackages; [
          luarocks # is the package manager for Lua modules
          luadbi-mysql # Database abstraction layer
        ];
      };

      xkb = {
        layout = "us,ru";
        options = "grp:win_space_toggle";
      };

      displayManager = {
        lightdm.enable = true;
        defaultSession = "none+awesome";
      };
    };
  };

  environment.systemPackages = with pkgs; [ arandr flameshot pavucontrol ];
}
