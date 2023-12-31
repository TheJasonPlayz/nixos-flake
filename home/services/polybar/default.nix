{ config, pkgs, ... }:

let
  xmonadMod = ''
    [module/xmonad]
    type = custom/script
    exec = ${pkgs.xmonad-log}/bin/xmonad-log

    tail = true
  '';
  modulesIni = builtins.readFile ./modules.ini;
  colorsIni = builtins.readFile ./colors.ini;
in {
  services.polybar = {
    enable = true;
    config = ./config.ini;
    extraConfig = xmonadMod + modulesIni + colorsIni;
    package = pkgs.polybar;
    script = ''
      polybar -r xmonad/top 2>${config.xdg.configHome}/polybar/logs/xmonad-top.log & disown
      polybar -r xmonad/bottom 2>${config.xdg.configHome}/polybar/logs/xmonad-bottom.log & disown     
    '';
  };
}
