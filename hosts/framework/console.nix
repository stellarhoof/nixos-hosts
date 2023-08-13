# Relevant: https://wiki.archlinux.org/title/Keyboard_shortcuts

{ pkgs, config, ... }: {
  # Enable setting virtual console options as early as possible (in initrd).
  console.earlySetup = true;

  # Uses `ckbcomp` to convert `services.xserver.xkb*` options into a
  # keymap file. Then `console.keyMap` is set to the keymap's path.
  console.useXkbConfig = true;

  # Writes configuration to `/etc/X11/xorg.conf.d/00-keyboard.conf`.
  services.xserver.xkbOptions = "ctrl:swapcaps";

  # actkbd is a keyboard shortcut daemon that works at the system level. It
  # does so through reading the events directly from the input devices,
  # thus working whether a graphical session is running or not.
  services.actkbd.enable = true;

  # Set keyboard delay/repeat rate in virtual consoles.
  # https://wiki.archlinux.org/title/Linux_console/Keyboard_configuration#Systemd_service
  # `<nixpkgs>/nixos/modules/services/wayland/cage.nix`
  systemd.services.kbdrate = {
    description = "Keyboard repeat rate in TTY";
    wantedBy = [ "multi-user.target" ];
    conflicts = [ "getty@tty8.service" ];
    after = [ "getty@tty8.service" ];
    unitConfig = { ConditionPathExists = "/dev/tty8"; };
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = "yes";
      # The X server starts on tty7, which is the last one with a virtual
      # console set up. Do this on tty8 to avoid messing up the virtual
      # console on the other ttys.
      TTYPath = "/dev/tty8";
      StandardInput =
        "tty-fail"; # Fail to start if cannot control the virtual terminal.
      StandardOutput = "journal";
      StandardError = "journal";
      ExecStart = "${pkgs.kbd}/bin/kbdrate --silent --delay 250 --rate 30";
    };
  };
}
