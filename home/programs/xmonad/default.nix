{ config, pkgs, ... }:

{ 
  home.packages = with pkgs; [ xmonad-log ];

  xsession.windowManager.xmonad = {
         enable = true;
        enableContribAndExtras = true;
        extraPackages = hp: [
        hp.dbus
        hp.monad-logger
        hp.xmonad-contrib
      ];
      libFiles = let 
        libDir = ./lib;
      in
      { 
       "Colors.hs" = "${libDir}/Colors.hs";
       "Vars.hs" = "${libDir}/Vars.hs";
       "Polybar.hs" = "${libDir}/Polybar.hs";
       "PolybarThemes/Hack.hs" = "${libDir}/PolybarThemes/Hack.hs";
     };
 };
}
