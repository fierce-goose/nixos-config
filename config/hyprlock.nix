{ config, pkgs, ... }: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 0;
        hide_cursor = true;
        no_fade_in = false;

        ignore_empty_input = true;
      };
      background = [{
        path = "/home/goose/wallpapers/5.jpg";
        blur_passes = 0;
      }];
      input-field = [{
        size = "1920, 100";
        position = "0, -200";
        dots_center = true;
        inner_color = "rgba(14, 25, 22, 0.6)";
        font_color = "rgba(234, 242, 229, 0.85)";
        outline_thickness = 0;
        fade_on_empty = false;
        rounding = 0;
        placeholder_text = "<span foreground=\"##eaf2e592\">Input Password...</span>";
        fail_text = "<span foreground=\"##eaf2e5d9\"><i>$FAIL <b>($ATTEMPTS)</b></i></span>";
      }];
      label = [
        {
          text = "$TIME";
          color = "rgba(234, 242, 229, 0.9)";
          font_size = 128;
          position = "0, 0";
          halign = "center";
          valign = "center";
          shadow_passes = 5;
          shadow_size = 5;
          shadow_color = "rgba(0, 0, 0, 0.1)";
        }
        {
          text = "Current layout: $LAYOUT";
          color = "rgba(14, 25, 22, 0.7)";
          font_size = 24;
          position = "30, -22";
          halign = "left";
          valign = "top";
        }
      ];
    };
  };
}
