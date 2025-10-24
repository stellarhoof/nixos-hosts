{
  lib,
  config,
  ...
}:

{
  programs.uwsm = {
    # uwsm wraps standalone Wayland compositors with a set of systemd units on
    # the fly, essentially binding them to `graphical-session-pre.target`,
    # `xdg-desktop-autostart.target`, and others. It also sets up the XDG
    # environment and DBUs activation.
    enable = true;

    waylandCompositors.hyprland = {
      prettyName = "Hyprland";
      binPath = "/run/current-system/sw/bin/Hyprland";
    };

    waylandCompositors.niri = {
      prettyName = "Niri";
      binPath = "/run/current-system/sw/bin/niri";
    };
  }

  programs.hyprland = {
    # Enable the Hyprland Wayland compositor. This is required even when using
    # home-manager to configure it.
    enable = true;

    # Add support for launching Hyprland via uwsm.
    withUWSM = true;

    # Disable xwayland support until necessary.
    xwayland.enable = false;
  };

  programs.niri = {
    # Enable the Niri Wayland compositor. This is required even when using
    # home-manager to configure it.
    enable = true;
  };

  # Blueman is a GTK frontend to BlueZ
  services.blueman.enable = config.hardware.bluetooth.enable;
}
