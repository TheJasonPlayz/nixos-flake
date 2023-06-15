{ config, pkgs, ... }:

{
  services = {
    pipewire = {
      enable = true;
      audio.enable = true;
      wireplumber.enable = true;
      alsa = {
        support32Bit = true;
        enable = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };

    dbus = {
      enable = true;
      packages = [ pkgs.dconf ];
    };

    xserver = {
      enable = true;

      displayManager.lightdm = { enable = true; };

      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
      };

      videoDrivers = [ "amdgpu" ];
    };
  };
  security.rtkit.enable = true;
  sound.enable = false;
  hardware.pulseaudio.enable = false;
  programs.dconf.enable = true;
}
