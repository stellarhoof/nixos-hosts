{
  config,
  pkgs,
  ...
}:

{
  imports = [
    # ./mimeapps.nix
    ../../programs/dunst.nix
    ../../programs/mpv.nix
    ../../programs/vimiv.nix
    ../../programs/zathura.nix
  ];

  # Allow fontconfig to discover installed fonts. It runs `fc-cache -f`.
  fonts.fontconfig.enable = true;

  # Run `hyprctl -j binds` to show all keybindings
  wayland.windowManager.hyprland.enable = true;

  wayland.windowManager.hyprland.systemd.enable = false;

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$browser" = "firefox";
    "$terminal" = "foot";
    "$menu" = "rofi -show drun";

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

  programs.firefox.enable = true;

  programs.rofi.enable = true;

  # There are lots of important env vars in `home.sessionVariables` that are not
  # available at the time Hyprland is started. This is a workaround to make sure
  # that Hyprland inherits the environment from fish.
  # See https://github.com/nix-community/home-manager/issues/2659
  programs.fish.loginShellInit = ''
    if test (tty) = /dev/tty1; or test (tty) = /dev/pts/0
      exec ${config.home.sessionVariables.XDG_CURRENT_DESKTOP}
    end
  '';

  home.packages = with pkgs; [
    cachix
    # Send notifications to a desktop notifications daemon
    libnotify
    # Screenshot tool
    grimblast
    # Command line clipboard utilities for wayland
    wl-clipboard
  ];

  home.sessionVariables = {
    # Some terminal applications rely on these variables instead of the XDG apps
    # standard (`xdg-open` et.al)
    BROWSER = "firefox";
    TERMINAL = "foot";
  };
}
