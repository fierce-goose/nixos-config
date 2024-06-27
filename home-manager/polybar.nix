{ pkgs, ... }: {
  services.polybar = {
    enable = true;
    script = "";
    settings = {
      "bar/bar1" = {
        monitor = "eDP-1";
        bottom = false;
        #tray.position = "right";

        width = "1910";
        height = "22";

        radius = 5;

        offset.x = "5";
        offset.y = "5";

        background = "#492B37";
        foreground = "#fff";

        padding.right = 1;
        padding.left = 1;

        font-0 = "System-ui Regular:size=11;3:antialias=false";
        font-1 = "Symbols Nerd Font:size=11;2:antialias=false";
        font-2 = "Symbols Nerd Font:size=16;3:antialias=false";
        font-3 = "System-ui Regular:size=10;2:antialias=false";
        font-4 = "System-ui Regular:size=6;1:antialias=false";
        font-5 = "Symbols Nerd Font:size=13;3:antialias=false";

        wm.restack = "bspwm";

        fixed.center = true;
        
        modules.left = "logo sp sep bspwm    msp msp msp msp sp sp sp sp    temp sp sp sep sp sp mem sp sp sep sp sp cpu";
        modules.center = "date sp sp sp time sp sp sp sp sp";
        modules.right = "bat sp sp sep sp sp vol sp sp sep sp sp wifi sp sp sep sp sp kbd    msp msp msp msp msp msp    tray";
      };
      "bar/bar2" = {
        monitor = "HDMI-1-0";
        bottom = false;
        
        width = "1270";
        height = "22";

        radius = 5;

        offset.x = "5";
        offset.y = "5";

        background = "#492B37";
        foreground = "#fff";

        padding.right = 1;
        padding.left = 1;

        font-0 = "System-ui Regular:size=11;3:antialias=false";
        font-1 = "Symbols Nerd Font:size=11;2:antialias=false";
        font-2 = "Symbols Nerd Font:size=16;3:antialias=false";
        font-3 = "System-ui Regular:size=10;2:antialias=false";
        font-4 = "System-ui Regular:size=6;1:antialias=false";
        font-5 = "Symbols Nerd Font:size=13;3:antialias=false";

        wm.restack = "bspwm";

        fixed.center = true;

        modules.left = "logo sp sep bspwm    msp msp sp sp sp sp    temp sp sp sep sp sp mem sp sp sep sp sp cpu";
        modules.center = "date sp sp sp time sp sp sp sp sp";
        modules.right = "bat sp sp sep sp sp vol sp sp sep sp sp wifi sp sp sep sp sp kbd    msp msp msp";
      };





      "module/date" = {
        type = "internal/date";
        interval = "86400";

        date = "%a %b %d";
        date-alt = "%Y-%m-%d";

        label = "%{F#faf} %{F-}%date%";
      };
      "module/time" = {
        type = "internal/date";
        interval = "1";
        
        time = "%H:%M:%S";

        label = "%{F#aff} %{F-}%time%";
      };
      "module/logo" = {
        type = "custom/text";

        format = "%{T3 F#9df}󱄅";

        click.left = "rofi -show power-menu -modi power-menu:rofi-power-menu";
      };
      "module/temp" = {
        type = "internal/temperature";

        thermal.zone = 0;

        ramp = [ "" "" "" "" "" ];
        ramp-foreground = "#faa";

        label = "%temperature-c%";

        format = "<ramp> <label>";
      };
      "module/mem" = {
        type = "internal/memory";
        interval = 2;
        format = "<label>";
        label = "%{F#ffa} %{F-}%gb_used%";
      };
      "module/cpu" = {
        type = "internal/cpu";
        interval = 2;
        format = "<label>";
        label = "%{F#aaf} %{F-}%percentage%%";
      };
      "module/bspwm" = {
        type = "internal/bspwm";
        
        pin-workspaces = true;
        inline-mod = true;
        enable-click = true;
        enable-scroll = false;

        format = "<label-state>";
        
        ws-icon = [ 
          "1;%{T3}󱅊"
          "2;%{T3}󱅋"
          "3;%{T3}󱅌"
          "4;%{T3}󱅍"
          "5;%{T3}󱅎"
          "6;%{T3}󱅏"
          "7;%{T3}󱅊"
          "8;%{T3}󱅋"
          "9;%{T3}󱅌"
        ];

        label-focused = "%icon%";
        label-focused-foreground = "#fff";
        label-focused-padding = 1;

        label-occupied = "%icon%";
        label-occupied-foreground = "#79A7BF";
        label-occupied-padding = 1;

        label-empty = "%icon%";
        label-empty-foreground = "#6fff";
        label-empty-padding = 1;

        label-urgent = "%icon%";
        label-urgent-foreground = "#B16F82";
        label-urgent-padding = 1;
      };
      "module/bat" = {
        type = "internal/battery";
        
        low-at = 10;

        format.charging = "%{F#afa}<ramp-capacity> %{F-}<label-charging>";
        format.discharging = "%{F#afa}<ramp-capacity> %{F-}<label-discharging>";
        format.full = "%{F#afa}<ramp-capacity> %{F-}100%";
        format.low = "%{F#f88}<animation-low> <label-low>";

        label.charging = "%percentage%%";
        label.discharging = "%percentage%%";
        label.low = "%percentage%%!";

        ramp-capacity = [ "" "" "" "" ];
        animation-low = [ "" "" ];
        animation-low-framerate = 1500;
      };
      "module/vol" = {
        type = "internal/alsa";
        format-volume = "%{F#f88}<ramp-volume> %{F-}<label-volume>";
        format-muted = "%{F#f88}󰸈 mut";

        label-volume = "%percentage%%";
        ramp-volume = [ "󰕿" "󰖀" "󰕾" ];

        click-right = "pavucontrol";
      };
      "module/wifi" = {
        type = "internal/network";
        interface = "wlp0s20f3";
        interface-type = "wireless";

        interval = 3;

        format-connected = "<ramp-signal>";
        format-disconnected = "<label-disconnected>";

        ramp-signal = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
        label-disconnected = "󰤮";
      };
      "module/kbd" = {
        type = "internal/xkeyboard";
        blacklist = [ "scroll lock" ];
        format = "<label-layout> <label-indicator>";

        layout-icon = [ "en" ];

        label-indicator-on = "%name%";

        label-indicator-on-capslock = "%{T6}󰯫 ";
        label-indicator-off-capslock = "";

        label-indicator-on-numlock = "%{T6}󰎦";
        label-indicator-off-numlock = "";
      };
      "module/tray" = {
        type = "internal/tray";
        tray-spacing = 3;
        tray-size = "70%";
      };
      "module/sp" = {
        type = "custom/text";
        format = "%{T5} ";
      };
      "module/msp" = {
        type = "custom/text";
        format = "          ";
      };
      "module/sep" = {
        type = "custom/text";
        format = "%{T4 F#6fff}|";
      };
    };
  };
}




















