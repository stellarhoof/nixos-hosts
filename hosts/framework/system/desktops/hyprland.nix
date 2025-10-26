{
  lib,
  pkgs,
  config,
  inputs,
  ...
}:

{
  # Minimal and flexible TTY-based login manager daemon.
  services.greetd.enable = true;

  # The greeter is what prompts the user for login credentials.
  services.greetd.settings.default_session = {
    # `tuigreet` is a simple TTY greeter. Everything after `--cmd` is what gets
    # run after the user logs in successfully.
    # NOTE: The `uwsm` module has to be enabled for this to work.
    command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd 'uwsm start select'";
    user = "ah";
  };

  programs.uwsm.waylandCompositors.hyprland = {
    prettyName = "Hyprland";
    comment = "Hyprland compositor managed by UWSM";
    binPath = lib.mkForce (lib.getExe config.programs.hyprland.package);
  };

  # Enable the Hyprland Wayland compositor. This is required even when using
  # home-manager to configure it.
  programs.hyprland.enable = true;

  programs.hyprland.package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

  # Add support for launching Hyprland via uwsm.
  programs.hyprland.withUWSM = true;

  # Disable xwayland support until necessary.
  programs.hyprland.xwayland.enable = false;

  # Blueman is a GTK frontend to BlueZ
  services.blueman.enable = config.hardware.bluetooth.enable;

  # Set screen backlight
  # brillo -S 20 -> set to 20%
  # brillo -G -> get current level
  hardware.brillo.enable = true;
}
