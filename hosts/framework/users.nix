{ pkgs, ... }: {
  # Set default user login shell.
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  # If set to `true`, you are free to add new users and groups to the
  # system with the ordinary `useradd` and `groupadd` commands. On
  # system activation, the existing contents of the `/etc/passwd` and
  # `/etc/group` files will be merged with the contents generated from
  # the `users.users` and `users.groups` options. The initial password
  # for a user will be set according to `users.users`, but existing
  # passwords will not be changed.
  #
  # If set to `false`, the contents of the user and group files will
  # simply be replaced on system activation. This also holds for the
  # user passwords; all changed passwords will be reset according to the
  # `users.users` configuration on activation.
  users.mutableUsers = false;

  # Indicates whether this is an account for a real user. This
  # automatically sets `group` to "users", `createHome` to `true`,
  # `home` to "/home/username", `useDefaultShell` to `true`, and
  # `isSystemUser` to `false`. Exactly one of `isNormalUser` and
  # `isSystemUser` must be true.
  users.users.ah.isNormalUser = true;

  users.users.ah.extraGroups = [
    # The wheel group is a special user group used on some Unix systems
    # to control access to the su command.
    "wheel"
    # Allows users to control NetworkManager. For example to connect to new
    # networks.
    "networkmanager"
    # Allows users access to a video device, such as the laptop screen, which is
    # required to set the backlight for example.
    "video"
  ];

  # Short description of the user account, typically the user's full name.
  users.users.ah.description = "Alejandro Hernandez";

  # Use `mkpasswd <pass>` to generate this hash.
  users.users.ah.hashedPassword =
    "$6$asKE3fbnF.L$LddoU0RvwWISACYJsw2Jy3LLjCr.p/ss7W2nMNYkoR6E0WzY7afwxW9JmLoPuQmLvTUfIzVyujGuScSqQlog5.";
}
