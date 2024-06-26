{ pkgs, ... }: {
  programs.feh.enable = true;

  xsession.windowManager.bspwm = {
    enable = true;
    
    extraConfig = ''
    feh --no-fehbg --bg-fill ~/wallpapers/japanese_gate.jpg &
    sleep 2
    killall -q polybar
    polybar -q bar1 &
    polybar -q bar2 &
    '';

    monitors = {
      eDP-1 = [ "1" "2" "3" "4" "5" "6" ];
      HDMI-1-0 = [ "7" "8" "9" ];
    };

    settings = {
      normal_border_color = "#66918c";
      active_border_color = "#9c7e93";
      focused_border_color = "#9c7e93";
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
    };
  };
}
