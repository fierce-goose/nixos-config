{ config, pkgs, ... }: {
  programs.waybar = {
    enable = true;
    style = ''
      * {
        border: none;
        border-radius: 0;

        font-family: "System-ui Regular", "Symbols Nerd Font";
        font-size: 15;
        color: #fff;

        padding-top: 0;
        padding-bottom: 0;
      }
      window#waybar {
        background: rgba(20, 49, 47, 0.67);
      }
      #workspaces, #clock, #mpd, #temperature, #cpu, #memory, #disk, #battery, #pulseaudio, #language, #network, #tray {
        padding: 0 0;
        margin: 0 5;
        background: transparent;
      }
      #keyboard-state {
        margin: 0;
      }
      #workspaces button {
        padding: 0 2;
        border-bottom: 2 solid transparent;
      }
      #workspaces button:hover {
        background: rgba(0, 5, 0, 0.13);
      }
      #workspaces button.active {
        border-bottom: 2 solid #ffffff;
      }
      #workspaces button.urgent {
        color: #f5a;
      }
    '';

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        output = [
          "eDP-1"
          "HDMI-A-1"
        ];
        modules-left = [ "custom/nixos" "hyprland/workspaces" "temperature" "cpu" "memory" "disk#root" "disk#home" ];
        modules-center = [ "clock" ];
        modules-right = [ "hyprland/language" "keyboard-state#capslock" "keyboard-state#numlock" "network" "pulseaudio" "battery" "tray" ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;

          format = "{id}";
        };
        "clock" = {
          format = "<span rise='1pt'> </span>{:%a %b %d <span rise='1pt'> </span>%H:%M:%S}";
          interval = 1;
        };
        "temperature" = {
          format = " <span rise='1pt'>{icon}</span>{temperatureC}°C";
          format-icons = [ " " " " " " " " ];
        };
        "cpu" = {
          format = "<span rise='1pt'> </span>{usage}%";
        };
        "memory" = {
          format = "<span rise='1pt'> </span>{percentage}%";
        };
        "disk#root" = {
          format = "<span rise='1pt'> /: </span>{free}";
          path = "/";
        };
        "disk#home" = {
          format = "<span rise='1pt'> ~/: </span>{free}";
          path = "/home/goose/";
        };
        "battery" = {
          format = "<span rise='1pt'>{icon}</span>{capacity}%";
          format-icons = [ " " " " " " " " " " ];
        };
        "pulseaudio" = {
          format = "<span rise='1pt'>{icon}</span>{volume}%";
          format-icons = [ "󰕿 " "󰖀 " "󰕾 " ];
          format-muted = " 󰸈  ";

          on-click = "pavucontrol";
          on-click-right = "amixer sset Master toggle";
        };
        "keyboard-state#capslock" = {
          capslock = true;
          
          format = {
            capslock = "<span rise='1pt' font='14'>{icon}</span>";
          };
          format-icons = {
            locked = "󰬈 ";
            unlocked = "";
          };
        };
        "keyboard-state#numlock" = {
          numlock = true;
          
          format = {
            numlock = "<span rise='1pt' font='14'>{icon}</span>";
          };
          format-icons = {  
            locked = "󰎤 ";
            unlocked = "";
          };
        };
        "hyprland/language" = {
          format = "<span rise='1pt'>󰇧 </span>{shortDescription}";
        };
        "network" = {
          interface = "wlp0s20f3";
          format-wifi = "<span rise='1pt'>{icon}</span>{essid} {signalStrength}%";
          format-icons = [ "󰤯 " "󰤟 " "󰤢 " "󰤥 " "󰤨 " ];
          format-disconnected = "󰤮 ";

          on-click = "kitty --class nmtui nmtui";
        };
        "custom/nixos" = {
          format = " <span size='20pt' color='#aef'>󱄅</span>";
        };
      };
    };
  };
}







