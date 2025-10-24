{ ... }:

{
  # The RealtimeKit system service hands out realtime scheduling
  # priority to user processes on demand. For example, PuseAudio and
  # PipeWire use this to acquire realtime priority.
  security.rtkit.enable = true;

  # https://wiki.archlinux.org/title/PipeWire#Audio
  # https://linuxhint.com/guide_linux_audio/
  services.pipewire.enable = true;

  # Enable ALSA support on pipewire.
  services.pipewire.alsa.enable = true;

  # Enable the PulseAudio server emulation. This allows pipewire to handle
  # sound for Bluetooth devices.
  services.pipewire.pulse.enable = true;
}
