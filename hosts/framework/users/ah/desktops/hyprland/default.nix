{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # ./colors.nix
    # ./fonts.nix
    # ./email.nix
    # ./media-keys-scripts.nix
    # ./fontconfig.nix
    # ./gtk.nix
    # ./mimeapps.nix
    # ./programs/dunst.nix
    # ./programs/mpv.nix
    # ./programs/firefox.nix
    # ./programs/vimiv.nix
    # ./programs/zathura.nix
    # ./qt/default.nix
    # ./wayland.nix
  ];

  # Run `hyprctl -j binds` to show all keybindings
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.systemd.enable = false;
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$browser" = "firefox";
    "$terminal" = "foot";
    "$menu" = "wofi --show drun";

    exec-once = "$terminal";

    input = {
      kb_layout = "us";
      kb_options = "ctrl:nocaps";
    };

    monitor = [
      # - `preferred`: Use the display's preferred size and refresh rate.
      # - `auto`: Let hyprland decide the monitor's position.
      # - `auto`: Let hyprland decide the scale of the monitor.
      ", preferred, auto, auto"
      # - `desc:*`: Use monitor's description as output by `hyprctl monitors all`.
      "desc:BNQ BenQ PD3220U, preferred, auto, 2"
    ];

    bind = [
      # Launch applications
      "$mod, return, exec, $terminal"
      "$mod, b, exec, $browser"
      "$mod, space, exec, $menu"

      # Compositor commands
      "$mod, m, exit"

      # Manage windows
      "$mod, q, killactive"

      # Move window focus
      "$mod, h, movefocus, l"
      "$mod, l, movefocus, r"
      "$mod, j, movefocus, d"
      "$mod, k, movefocus, u"

      # Switch workspaces
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
    ];
  };

  programs.foot.enable = true;
  programs.wofi.enable = true;
  programs.firefox.enable = true;

  home.packages = with pkgs; [
    cachix
    # libnotify # Send notifications to a desktop notifications daemon
    # # transmission_4-qt # Just to have a QT app
    # transmission_4-gtk # BitTorrent downloader
  ];

  # Some terminal applications rely on these variables instead of the XDG apps
  # standard (`xdg-open` et.al)
  home.sessionVariables = {
    BROWSER = "firefox";
    TERMINAL = "foot";
  };

  # # Whether new or changed services that are wanted by active targets
  # # should be started. Additionally, stop obsolete services from the
  # # previous generation.
  # systemd.user.startServices = false;

  # # The cursor theme and settings.
  # home.pointerCursor.name = "graphite-dark-nord";
  # home.pointerCursor.package = pkgs.graphite-cursors;
  # home.pointerCursor.size = 24;

  # # Also apply cursor to gtk configuration
  # home.pointerCursor.gtk.enable = true;
}
