{ ... }: {
  # https://wiki.archlinux.org/title/PipeWire#Audio
  # https://linuxhint.com/guide_linux_audio/
  services.pipewire.enable = true;

  # Enable ALSA support on pipewire.
  services.pipewire.alsa.enable = true;

  # Enable the PulseAudio server emulation. This allows pipewire to handle sound
  # for BlueTooth devices.
  services.pipewire.pulse.enable = true;
}
