{ config, pkgs, ... }:

{
    programs = {
        steam = {
            enable = true;
            gamescopeSession.enable = true;
            remotePlay.openFirewall = true;
        };

        gamemode = {
            enable = true;
            enableRenice = true;
        };

        zsh = {
            enable = true;
            shellInit = ''
                neofetch
            '';
            shellAliases = {
                rebuild = "sudo nixos-rebuild switch";
                xmocomp = "xmonad --recompile && xmonad --restart";
            };
            ohMyZsh = {
                enable = true;
                theme = "eastwood";
                plugins = [
                    "git"
                    "1password"
                ];
            };
        };

        java.enable = true;
    };
}
