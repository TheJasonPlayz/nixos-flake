{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix 
      ./hardware.nix
      ./programs.nix
      ./services.nix
      ./system-pkgs.nix
      <home-manager/nixos>
      ./home/home.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
#  boot.bootspec.enable = true;
#  boot.lanzaboote.enable = true;
#  boot.lanzaboote.pkiBundle = "/etc/secureboot";

  networking.hostName = "JASONS_NIXOS"; 
  networking.networkmanager.enable = true;

  time.timeZone = "America/Denver";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  users.users.jasonw = {
    isNormalUser = true;
    extraGroups = [ "tty" "networkmanager" "wheel" "uucp" "dialout" "mlocate" ];
    shell = pkgs.zsh;
  };

  fonts.fonts = with pkgs; [
    nerdfonts
  ];
  
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
 
  # Recomemended to leave at the release version of first install. For documentation, see https://nixos.org/nixos/options.html
  system.stateVersion = "23.05";
}
