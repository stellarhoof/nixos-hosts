{ ... }: {
  # Bluetooth via BlueZ.
  hardware.bluetooth.enable = true;

  # Written to /etc/bluetooth/main.conf
  hardware.bluetooth.settings = {
    General = {
      # https://wiki.archlinux.org/title/Bluetooth#Discoverable_on_startup
      DiscoverableTimeout = 0;
    };
  };
}
