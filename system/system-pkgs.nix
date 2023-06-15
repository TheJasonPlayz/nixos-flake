{ pkgs, ... }:

let
  development = with pkgs; [
    vscode
    arduino
    git
    super-slicer-latest
    printrun
    nixfmt
    nil
  ];
  gaming = with pkgs; [
    minecraft
    prismlauncher
    goverlay
    mangohud
    lutris
    bottles
    protonup-qt
    heroic
  ];
  deps = with pkgs; [
    yad
    winePackages.minimal
    unzip
    xdotool
    xxd
    xorg.xwininfo
    bluez-alsa
    arc-theme
  ];
  apps = with pkgs; [
    pavucontrol
    brave
    paprefs
    krita
    gimp
    blueberry
    discord
    kmenuedit
    lxappearance
    obsidian
    manuskript
  ];
  utils = with pkgs; [
    steam-run
    mlocate
    wget
    bluez-tools
    killall
    alsa-utils
    usbutils
    fontpreview
    neofetch
    _1password
    stow
  ];
in {
  environment.systemPackages = development ++ gaming ++ deps ++ apps ++ utils;
}
