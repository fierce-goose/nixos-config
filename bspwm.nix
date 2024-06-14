{pkgs, ...}: let
wallpaper = pkgs.fetchurl {
  url = "https://gitlab.com/unaboomer/wal/-/raw/222e7bbc8a173cf1c75a92aad553bf6fe1f27f44/gnu/Lambdas.png";
  hash = "sha256-bqW9WAQ4oA1zx57JQlqkoR1kNd0bFeAepkwms3DDl3w=";
};
#bspswallow = pkgs.fetchurl {
#  url = "https://raw.githubusercontent.com/JopStro/bspswallow/master/bspswallow";
#  hash = "sha256-xhgaVwqFZ9LTKUnlDoYXD5+oiVekYENASb2jXUmlMyI=";
#  executable = true;
#};
in {
# BSPWM #
# Extra Packages
programs.feh = {enable = true;};
home.packages = with pkgs; [
  alsa-utils 
];
# Swallowing
home.file = {
  ".config/bspwm/noswallow" = {
    text = ''
    xev
    '';
  };
  ".config/bspwm/terminals" = {
    text = ''
    Alacritty
    '';
  };
};
# sxhkd
services.sxhkd = {
  enable = true;
  keybindings = {
    "super + Return" = "alacritty";
    "super + {_,shift + }{1-9,0}" = "bspc {desktop -f, node -d} '^{1-9,10}'";
    "super + x; r" = "bspc wm -r ; pkill -USR1 -x sxhkd";
    "super + x; c" = "bspc quit";
    "super + d" = "dmenu_run -p 'Run:'";
    "super + shift + m" = "alacritty -e alsamixer --card=0 --view=all";
    "XF86MonBrightness{Up,Down}" = "brightnessctl set 5%{+,-}";
    "XF86Audio{Raise,Lower}Volume" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%{+,-}";
    "F8" = "wpa_gui";
    "Print" = "maim -u ~/docs/pic/scr/pic-full-$(date +%Y.%m.%d-%H:%M:%S).png | xclip -sel clip -t image/png ; notify-send 'Screenshot' 'Full Screen'";
    "control + Print" = "maim -u -s ~/docs/pic/scr/pic-part-$(date +%Y.%m.%d-%H:%M:%S).png | xclip -sel clip -t image/png ; notify-send 'Screenshot' 'Part of the Screen'";
    "super + shift + q" = "bspc node -c";
    "super + shift + r" = "bspc wm -r";
    "super + y" = "bspc node -g sticky";
    "super + t" = "bspc node -t '~'floating";
    "super + f" = "bspc node -t '~'fullscreen";
    #"super + z" = pkgs.writeShellScript "winhide" ''
    #  hidden=$(bspc query -N -n .hidden -d focused)
    #  if [ -z "$hidden" ]; then
    #    bspc node focused -g hidden=on
    #  else
    #  bspc node "$hidden" -g hidden=off
    #  fi
    #'';
    "super + Escape" = "pkill -USR1 -x sxhkd";
    "super + {Left,Down,Up,Right}" = "bspc node -v {-25 0,0 25,0 -25,25 0}"; # Move Floating Window
  };
};

# bspmw
xsession.windowManager.bspwm = {
  enable = true;
  startupPrograms = [
    "sxhkd"
    "dunst"
    "polybar"
    "picom -b"
    "feh --no-fehbg --bg-fill ${wallpaper}"
    #"pgrep bspswallow || ${bspswallow} &>/dev/null"
  ];
  monitors = {eDP-1 = ["1" "2" "3" "4" "5" "6" "7" "8" "9" "10"];};
#  rules = {
#    "Gimp" = {
#      desktop = "^8";
#      state = "tiled";
#      follow = true;
#    };
#    "telegram-desktop" = {state = "floating";};
#    "Просмотр медиа" = {state = "floating";};
#  };
  settings = {
    # Colors #
    normal_border_color = "#504945";
    active_border_color = "#98971a";
    focused_border_color = "#98971a";
    # Setting #
    border_width = 3;
    top_padding = 24;
    window_gap = 0;
    focus_follows_pointer = true;
    pointer_follows_focus = true;
    split_ratio = 0.50;
    borderless_monocle = true;
    single_monocle = true;
    gapless_monocle = true;
  };
};
}
