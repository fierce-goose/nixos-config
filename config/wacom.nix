{ config, pkgs, inputs, ... }: {
  services.xserver = {
    digimend.enable = true;

    inputClassSections = [
      ''
        Identifier "Wacom Intuos BT M Pen"
        MatchUSBID "0x56a:0x378"
        MatchIsTablet "on"
        Driver "wacom"
      ''
      ''
        Identifier "Wacom Intuos BT M Pad"
        MatchUSBID "0x56a:0x378"
        MatchIsKeyboard "on"
        Driver "libinput"
      ''
    ];
  };

  environment.systemPackages = [
    config.boot.kernelPackages.digimend
    pkgs.evemu
    pkgs.evtest
  ];
}