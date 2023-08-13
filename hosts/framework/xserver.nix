{ ... }: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Writes configuration to `/etc/X11/xorg.conf.d/00-keyboard.conf`.
  services.xserver.xkbOptions = "ctrl:swapcaps";

  # Length of time in ms that a key must be depressed before autorepeat starts.
  services.xserver.autoRepeatDelay = 250;

  # Length of time in ms that should ellapse between autorepeat generated
  # keystrokes.
  services.xserver.autoRepeatInterval = 30;

  # https://nixos.org/manual/nixos/stable/index.html#sec-x11--graphics-cards-intel
  services.xserver.videoDrivers = [ "modesetting" ];

  # 96dpi is taken as 100% so 200% is 96*2
  services.xserver.dpi = 192;

  # A display manager, or login manager, is a graphical user interface
  # that is displayed at the end of the boot process in place of the
  # default shell. It allows users to enter their username and password
  # and on authentication, loads a window or desktop manager.
  services.xserver.displayManager.lightdm.enable = true;

  # Commands executed just before the window or desktop manager starts
  # https://wiki.archlinux.org/title/HiDPI
  services.xserver.displayManager.sessionCommands = ''
    # Scale gtk UI elements by this factor
    export GDK_SCALE=2

    # Scale down fonts by half
    export GDK_DPI_SCALE=0.5

    # Honor screen DPI
    export QT_AUTO_SCREEN_SCALE_FACTOR=1
  '';

  # Let users manage their own session
  services.xserver.windowManager.session = [{
    name = "xsession";
    start = "$HOME/.xsession";
  }];

  # Enable touchpad support (enabled by default in most desktop managers).
  services.xserver.libinput.enable = true;

  # The click method defines how button events are triggered on a clickpad.
  # When set to `buttonareas`, the bottom area of the touchpad is divided
  # into a left, middle and right button area. When set to `clickfinger`, the
  # number of fingers on the touchpad decide the button type. Clicking with
  # 1, 2, 3 fingers triggers a left, right, or middle click, respectively.
  services.xserver.libinput.touchpad.clickMethod = "buttonareas";

  # Palm detection sucks so when typing an accidental tap sends the
  # cursor to no-man's land.
  services.xserver.libinput.touchpad.tapping = false;

  # Necessary to configure GTK/Gnome.
  # https://nix-community.github.io/home-manager/index.html#_why_do_i_get_an_error_message_about_literal_ca_desrt_dconf_literal
  programs.dconf.enable = true;
}
