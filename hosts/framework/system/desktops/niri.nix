{
  lib,
  config,
  pkgs,
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

  programs.uwsm.waylandCompositors.niri = {
    prettyName = "Niri";
    comment = "Niri compositor managed by UWSM";
    binPath = pkgs.writeShellScript "niri" ''
      ${lib.getExe config.programs.niri.package} --session
    '';
  };

  # It is recommended to use niri via its overlay instead of using the flake
  # output directly like hyprland above.
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  # Enable the Niri Wayland compositor. This is required even when using
  # home-manager to configure it.
  programs.niri.enable = true;

  # Use the niri package from the overlay above.
  programs.niri.package = pkgs.niri-stable;

  # Blueman is a GTK frontend to BlueZ
  services.blueman.enable = config.hardware.bluetooth.enable;

  # Set screen backlight
  # brillo -S 20 -> set to 20%
  # brillo -G -> get current level
  hardware.brillo.enable = true;
}
