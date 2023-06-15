{ config, pkgs, ... }:

{
  services.picom = {
    opacityRules = [ "0:_NET_WM_STATE@:32a *= NET_WM_STATE_FULLSCREEN" ];
    enable = true;
  };
}
