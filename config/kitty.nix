{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    shellIntegration.enableBashIntegration = false;
    shellIntegration.enableFishIntegration = false;
    theme = "Pnevma";
  };
}
