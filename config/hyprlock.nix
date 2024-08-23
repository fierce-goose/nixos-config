{ config, pkgs, ... }: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 0;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [{
       path = "/home/goose/wallpapers/5.jpg";
       blur_passes = 0;
      }];

      input-field = [{
        size = "1920, 100";
        position = "0, 0";

        dots_center = true;

        inner_color = "rgba(0, 5, 0, 0.5)";
        font_color = "rgba(200, 210, 200, 0.7)";

        outline_thickness = 0;

        fade_on_empty = false;

        rounding = 0;

        placeholder_text = "<span foreground=\"##ffffff35\">Input Password...</span>";
        fail_text = "<span foreground=\"##ffffff35\"><i>$FAIL <b>($ATTEMPTS)</b></i></span>";
      }];
    };
  };
}
