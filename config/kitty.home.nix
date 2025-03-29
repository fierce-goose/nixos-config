{ ... }: {
  programs.kitty = {
    enable = true;

    shellIntegration.enableZshIntegration = true;
    shellIntegration.enableBashIntegration = false;
    shellIntegration.enableFishIntegration = false;

    theme = "Everforest Dark Medium";

    extraConfig = ''
    # 0 disables it; -1 enables it
    confirm_os_window_close 0
    '';
  };
}
