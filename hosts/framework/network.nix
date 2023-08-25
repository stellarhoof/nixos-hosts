{ config, pkgs, ... }: {
  networking.hostName = "framework";

  # A wifi daemon written by Intel. Mutually exclusive with wpa_supplicant.
  # Disabled because sometimes the wireless interface will simply
  # dissapear and I don't know how to fix.
  # networking.wireless.iwd.enable = true;

  # Enable NetworkManager. Connect with one of:
  # - `nmtui`
  # - `nmcli device wifi connect "<ssid>" password "<pass>"`
  networking.networkmanager.enable = true;

  # Use iwd as the wifi backend for network manager.
  # networking.networkmanager.wifi.backend = "iwd";

  # Extend default networkmanager functionality.
  networking.networkmanager.plugins = with pkgs;
    [
      networkmanager-openvpn # Manage openvpn configs
    ];

  # Run SSH server so computers in the local network can ssh into this one.
  services.openssh.enable = true;

  # Require public key authentication for better security.
  services.openssh.settings.PasswordAuthentication = false;

  # Avahi is a system which facilitates service discovery on a local network.
  # This enables you to plug your laptop or computer into a network and
  # instantly be able to view other people who you can chat with, find printers
  # or find files being shared.
  services.avahi.enable = true;

  # Whether to enable the mDNS NSS (Name Service Switch) plug-in. Enabling it
  # allows applications to resolve names in the `.local' domain by transparently
  # querying the Avahi daemon.
  services.avahi.nssmdns = true;

  # Whether to allow publishing in general.
  services.avahi.publish.enable = true;

  # Whether to register mDNS address records for all local IP addresses.
  services.avahi.publish.addresses = true;
}
