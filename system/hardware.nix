{ config, pkgs, ... }:

{
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    xpadneo.enable = true;
    xone.enable = true;

  };

  environment.systemPackages = [ pkgs.mesa ];
}
