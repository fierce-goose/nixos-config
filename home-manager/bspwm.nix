{ pkgs, ... }: {
  programs.feh.enable = true;

  xsession.windowManager.bspwm = {
    enable = true;
    
    extraConfig = ''
    feh --no-fehbg --bg-fill ~/wallpapers/japanese_gate.jpg &
    killall -q polybar
    polybar -q bar1 &
    polybar -q bar2 &
    '';

    monitors = {
      eDP-1 = [ "1" "2" "3" "4" "5" "6" ];
      HDMI-1-0 = [ "7" "8" "9" ];
    };

    settings = {
      normal_border_color = "#79A7BF";
      active_border_color = "#F0A4B9"; #B16F82
      focused_border_color = "#F0A4B9";
      border_width = 2;
      window_gap = 5;
      focus_follows_pointer = true;
      pointer_follows_focus = true;
    };

    rules = {
      "Lxappearance" = {
        state = "floating";
      };
      "tailor_gui" = {
        state = "floating";
        rectangle = "600x400+660+300";
      };
      "obs" = {
        state = "floating";
        rectangle = "1000x600+460+150";
      };
      "Pavucontrol" = {
        state = "floating";
        rectangle = "1000x600+460+150";
      };
    };
  };
}
