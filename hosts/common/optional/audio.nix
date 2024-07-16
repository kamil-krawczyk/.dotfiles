{ config, lib, ... }:

with lib;

{
  options.host.audio.enable = mkEnableOption "";

  config = mkIf config.host.audio.enable {
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
