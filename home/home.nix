{ config, pkgs, ... }:

let
   username = "jasonw";
   homeDirectory = "/home/${username}";
   configHome = "${homeDirectory}/.config";
   homePkgs = with pkgs; [
     nitrogen
     sd-switch
   ];
in
{
  home-manager.users.${username} = { pkgs, ... }: {
  programs.home-manager.enable = true;

  imports = builtins.concatMap import [
    ./programs
    ./services
  ];
  
  xsession = {
    enable = true;
    initExtra = ''
        nitrogen --restore &
        wireplumber &
    ''; 
  };

  xdg = {
    enable = true;
    inherit configHome;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };  
  
  home = {
    inherit username homeDirectory;
    stateVersion = "23.05"; 
    
    sessionVariables = {
      DISPLAY = ":0";
      EDITOR = "nano";
    };

    packages = homePkgs;
  };

  services.dunst.enable = true;

  systemd.user.startServices = "sd-switch";
 };
}
