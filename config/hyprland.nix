{ config, pkgs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = pkgs.hyprland;

    settings = {
      monitor = [
        "eDP-1, highres, auto, 1"
        "desc:Dell Inc. DELL E196FP KC14766960KL, 1280x1024, auto, 1"
        ", highres, auto, 1"
      ];

      dwindle = {
        preserve_split = true;
        force_split = 2;
      };

      input = {
        kb_layout = "us, ru";
        kb_options = "grp:win_space_toggle";

        repeat_rate = 25;
        repeat_delay = 300;

        numlock_by_default = true;
      };

      debug = {
        disable_logs = false;
      };

      general = {
        border_size = 1;
        "col.active_border" = "rgba(ffffffff)";
        "col.inactive_border" = "rgba(7bafabff)";

        gaps_in = 4;
        gaps_out = 30;
      };

      decoration = {
        active_opacity = 0.8;
        inactive_opacity = 0.6;

        rounding = 5;

        blur = {
          enabled = true;
          size = 8;
          passes = 4;
          ignore_opacity = true;
          #xray = true;
          contrast = 1.0;
          brightness = 1.0;
          #vibrancy = 0.0;
          #vibrancy_darkness = 1.0;
        };

        drop_shadow = true;
        shadow_range = 15;
        "col.shadow" = "rgba(0B191A66)";
      };

      group = {
      	"col.border_active" = "0xff68902f";
      	"col.border_inactive" = "0xee68902f";
      	groupbar = {
      	  enabled = true;
      	  "col.active" = "0xaa14312f";
      	  "col.inactive" = "0xa914312f";
      	};
      };

      misc = {
      	middle_click_paste = false;
      };

      exec-once = [
        "blueman-applet & sleep 2; waybar & sleep 2; killall -SIGUSR2 waybar"
        "hyprlock"
        "clipse -listen"
      ];

      workspace = [
        "1,monitor:eDP-1"
        "2,monitor:eDP-1"
        "3,monitor:eDP-1"
        "4,monitor:eDP-1"
        "5,monitor:eDP-1"
        "6,monitor:eDP-1"
        "7,monitor:eDP-1"
        "8,monitor:HDMI-A-1"
        "9,monitor:HDMI-A-1"
        "10,monitor:HDMI-A-1"
      ];

      bind = [
        # tiling
        "SUPER, ESCAPE, killactive"
        "SUPER SHIFT, F, togglefloating"
        ", F11, fullscreen"

        "SUPER,1,workspace,1"
        "SUPER,2,workspace,2"
        "SUPER,3,workspace,3"
        "SUPER,4,workspace,4"
        "SUPER,5,workspace,5"
        "SUPER,6,workspace,6"
        "SUPER,7,workspace,7"
        "SUPER,8,workspace,8"
        "SUPER,9,workspace,9"
        "SUPER,0,workspace,10"

        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2" 
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        "SUPER SHIFT, 6, movetoworkspace, 6"
        "SUPER SHIFT, 7, movetoworkspace, 7"
        "SUPER SHIFT, 8, movetoworkspace, 8"
        "SUPER SHIFT, 9, movetoworkspace, 9"
        "SUPER SHIFT, 0, movetoworkspace, 10"

        "SUPER, K, moveoutofgroup"
        "SUPER, J, togglegroup"
        "SUPER, L, changegroupactive, f"
        "SUPER, H, changegroupactive, b"

        # programs
        "SUPER, RETURN, exec, kitty"
        "SUPER, B, exec, firefox"
        "SUPER ALT, B, exec, firefox --private-window"
        "SUPER CONTROL ALT SHIFT, B, exec, tor-browser"
        "SUPER CONTROL ALT SHIFT, T, exec, ayugram-desktop"
        "SUPER, O, exec, obs"
        "SUPER, T, exec, tailor_gui"
        "SUPER, N, exec, obsidian"
        "SUPER, V, exec, code"
        "SUPER, E, exec, nemo"

        "SUPER, C, exec, hyprpicker -a --format=hex"
        "SUPER ALT, C, exec, hyprpicker -a --format=rgb"
        "SUPER, D, exec, wofi --show drun"
        "SUPER, PERIOD, exec, kitty --class clipse -e clipse"

        # media
        ", XF86AudioRaiseVolume, exec, amixer sset Master 5%+"
        ", XF86AudioLowerVolume, exec, amixer sset Master 5%-"
        ", XF86AudioMute, exec, amixer sset Master toggle"

        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"

        "ALT, XF86MonBrightnessUp, exec, brightnessctl set 1%+"
        "ALT, XF86MonBrightnessDown, exec, brightnessctl set 1%-"

        ", XF86KbdBrightnessUp, exec, brightnessctl --device=rgb:kbd_backlight set 20%+"
        ", XF86KbdBrightnessDown, exec, brightnessctl --device=rgb:kbd_backlight set 20%-"

        ", Print, exec, grim -g \"$(slurp)\" - | wl-copy -t image/png"
        "ALT, Print, exec, grim -g \"$(slurp)\""
        "CONTROL, Print, exec, grim"

        # system
        "SUPER SHIFT, R, exec, reboot"
        "SUPER SHIFT, P, exec, poweroff"
        "SUPER SHIFT, L, exec, hyprlock"
        "SUPER SHIFT ALT, R, exec, hyprctl reload; killall waybar; waybar &"
      ];

      bindm = [
        "SUPER, mouse:273, resizewindow"
        "SUPER, ALT_L, resizewindow"
        "SUPER, mouse:272, movewindow"
        "SUPER, Control_L, movewindow"
      ];


      bezier = [
        "easeInQuint, 0.64, 0, 0.78, 0"
        "easeOutQuint, 0.22, 1, 0.36, 1"
        "easeInOutQuint, 0.83, 0, 0.17, 1"

        "easeInBack, 0.36, 0, 0.66, -0.56"
        "easeOutBack, 0.34, 1.56, 0.64, 1"
        "easeInOutBack, 0.68, -0.6, 0.32, 1.6"
      ];

      animation = [
        "windowsIn, 1, 3, easeOutBack"
        "windowsOut, 1, 3, easeOutBack"
        "windowsMove, 1, 3, easeOutQuint"

        "fadeIn, 1, 3, easeOutQuint"

        "workspaces, 1, 3, easeInBack"
      ];

      windowrulev2 = [
        "float,class:(clipse)"
        "size 622 652,class:(clipse)"

        "float,class:(nmtui)"
        "size 747 594,class:(nmtui)"
        "move 100%-w-10 36,class:(nmtui)"

        "float,class:(pavucontrol)"
        "size 722 552,class:(pavucontrol)"
        "move 100%-w-10 36,class:(pavucontrol)"

        "float,class:(Tailor)"
        "size 550 500,class:(Tailor)"
        "move onscreen cursor -50% -50%,class:(Tailor)"

        # "opacity 1.5, title:(.*)(YouTube — Mozilla Firefox)(.*)"
      ];
    };
  };
}

























