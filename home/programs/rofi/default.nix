{ config, pkgs, ... }:

{
  programs.rofi = rec {
    enable = true;
    extraConfig = {
      modes = "combi";
      combi-hide-mode-prefix = true;
      combi-modes = "window,run,drun,filebrowser";
      terminal = "${terminal}";
      # icon-theme = ""
      run-shell-command = "${terminal} -e --hold {cmd}";
    };
    terminal = "kitty";
    theme = "Arc-Dark";
  };
}
