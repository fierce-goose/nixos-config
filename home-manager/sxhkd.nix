{ pkgs, ... }: {
  services.sxhkd = {
    enable = true;
    keybindings = {
      "super + {Return,b,d}" = "{alacritty,firefox,rofi -show drun}";
      "super + alt + b" = "firefox --private-window";
      "super + ctrl + alt + shift + {t}" = "{telegram-desktop}";

      "super + ctrl + {r,p}" = "{reboot,poweroff}";

      "super + {_,shift + }{1-6}" = "bspc {desktop -f,node -d} '^{1-6}'";
      "super + alt + {_,shift + }{1-3}" = "bspc {desktop -f,node -d} '^{7-9}'";

      "super + {_,shift + }Escape" = "bspc node -{c,k}";
      "super + shift + {f,t,p}" = "bspc node -t ~{floating,tiled,pseudo_tiled}";
      "F11" = "bspc node -t ~fullscreen";

      "super + alt + r" = "bspc wm -r";

      "XF86MonBrightness{Up,Down}" = "brightnessctl set 5%{+,-}";
      "XF86Audio{Raise,Lower}Volume" = "amixer sset Master 5%{+,-}";
      "XF86KbdBrightness{Up,Down}" = "brightnessctl --device=rgb:kbd_backlight set 20%{+,-}";
    };
  };
}
