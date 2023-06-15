{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    #font.name
    shellIntegration.enableZshIntegration = true;
    #theme
    settings = {
      enable_audio_bell = false;
      confirm_os_window_close = 0;
      foreground = "#0c8a24";
      background_opacity = "0.7";
    };
  };
}
