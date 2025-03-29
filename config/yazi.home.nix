{ config, pkgs, ... }: {
  programs.yazi = {
    enable = true;
    settings = {
      manager = {
        show_hidden = true;
      };
      opener = {
        edit = [
          {
            run = "$EDITOR \"$@\"";
            block = true;
            for = "unix";
          }
        ];
      };
    };
  };
}
