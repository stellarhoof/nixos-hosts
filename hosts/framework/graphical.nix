{ lib, config, ... }: {
  # Blueman is a GTK frontend to BlueZ
  services.blueman.enable = lib.mkif config.hardware.bluetoot.enable;

  # Enable the Hyprland Wayland compositor. This is required even if using
  # home-manager to configure it.
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = false;

  # Enable the Wayfire Wayland compositor.
  programs.wayfire.enable = true;
}
