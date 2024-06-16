{pkgs, ...}: {
  services.sxhkd = {
    enable = true;
    keybindings = {
      "super + Return" = "alacritty";
      "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";
      "super + {_,shift + }Escape" = "bspc node -{c,k}";
      "XF86MonBrightness{Up,Down}" = "brightnessctl set 5%{+,-}";
      "XF86Audio{Raise,Lower}Volume" = "amixer sset Master 5%{+,-}";
    };
  };
  
  xsession.windowManager.bspwm = {
    enable = true;
    monitors = {
      "^0" = ["1" "2" "3" "4" "5" "6" "7" "8" "9" "10"];
      "^1" = ["1" "2" "3" "4" "5" "6" "7" "8" "9" "10"];
    };
    startupPrograms = [
      "sxhkd"
      "polybar"
      "dunst"
    ];
  };
}
