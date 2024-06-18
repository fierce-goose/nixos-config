{pkgs, ...}: {
  services.sxhkd = {
    enable = true;
    keybindings = {
      "super + {Return,b}" = "{alacritty,firefox}";
      "super + shift + b" = "firefox --private-window";
      "super + ctrl + alt + shift + {t}" = "telegram-desktop";
      
      "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";

      "super + {_,shift + }Escape" = "bspc node -{c,k}";
      "super + f" = "bspc node -t ~floating";
      "F11" = "bspc node -t ~fullscreen";

      "super + alt + r" = "bspc wm -r";

      "XF86MonBrightness{Up,Down}" = "brightnessctl set 5%{+,-}";
      "XF86Audio{Raise,Lower}Volume" = "amixer sset Master 5%{+,-}";
    };
  };
  
  xsession.windowManager.bspwm = {
    enable = true;
    startupPrograms = [
      "sxhkd"
      "polybar"
      "dunst"
      
      "autorandr -c"
    ];
    monitors = {
      eDP-1 = ["1" "2" "3" "4" "5" "6" "7"];
      HDMI-1-0 = ["8" "9" "10"];
    };
    rules = {};
    settings = {
      normal_border_color = "#788f81";
      active_border_color = "#30c970";
      focused_border_color = "#30c970";
      border_width = 3;
      #top_padding = 24;
      window_gap = 5;
      focus_follows_pointer = true;
      pointer_follows_focus = true;
    };
  };

  services.picom = {
    enable = true;
    backend = "glx";
    inactiveOpacity = 0.5;
    activeOpacity = 0.9;
    menuOpacity = 0.9;
    opacityRules = [
      "100:_NET_WM_STATE@[1]:32a = '_NET_WM_STATE_FULLSCREEN'"
      "100:_NET_WM_STATE@[2]:32a = '_NET_WM_STATE_FULLSCREEN'"
      "100:_NET_WM_STATE@[3]:32a = '_NET_WM_STATE_FULLSCREEN'"
      "100:_NET_WM_STATE@[4]:32a = '_NET_WM_STATE_FULLSCREEN'"
    ];
    fade = true;
    fadeDelta = 5;
    vSync = true;
    shadow = true;
    shadowOffsets = [ (-18) (-17) ];
    settings = {
      corner-radius = 10.0;
      blur = {
        method = "gaussian";
        size = 10;
        deviation = 5.0;
      };
    };
  };
}
