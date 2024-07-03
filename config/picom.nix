{ pkgs, ... }: {
  services.picom = {
    enable = true;
    backend = "egl";
    activeOpacity = 0.9;
    inactiveOpacity = 0.8;
    opacityRules = [
      "100:_NET_WM_STATE@[0]:32a = '_NET_WM_STATE_FULLSCREEN'"
      "100:_NET_WM_STATE@[1]:32a = '_NET_WM_STATE_FULLSCREEN'"
      "100:_NET_WM_STATE@[2]:32a = '_NET_WM_STATE_FULLSCREEN'"
      "100:_NET_WM_STATE@[3]:32a = '_NET_WM_STATE_FULLSCREEN'"
      "100:_NET_WM_STATE@[4]:32a = '_NET_WM_STATE_FULLSCREEN'"
      "90:name *= 'Firefox' && !focused"
      "90:name *= 'Telegram' && !focused"
      "90:name *= 'polybar'"
      "100:name *= 'rofi'"
      "100:name *= 'Gpick'"
    ];
    fade = true;
    fadeDelta = 5;
    vSync = true;
    shadow = true;
    shadowOffsets = [ (-18) (-17) ];
    shadowOpacity = 1.0;
    settings = {
      corner-radius = 8.0;
      rounded-corners-exclude = [
        "name *= 'rofi'"
      ];
      blur = {
        method = "gaussian";
        size = 20;
        deviation = 10.0;
      };
      blur-background-exclude = [
        "!focused"
      ];
    };
  };
}
