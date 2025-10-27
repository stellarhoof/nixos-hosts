{ pkgs, config, ... }:

{
  imports = [
    # ../../desktops/hyprland.nix
    # ../../desktops/niri.nix
    ../../desktops/cosmic.nix
  ];

  # This overrides `SSH_AUTH_SOCK` to a non-existing socket file.
  # I tried every other option to fix this without disabling `gnome-keyring` but
  # they didn't work so the nuclear option it is. If something fails in the
  # future because it needs the `gnome-keyring` daemon to be present I'll
  # re-evaluate.
  services.gnome.gnome-keyring.enable = false;

  # Do not start ssh support via gcr.
  services.gnome.gcr-ssh-agent.enable = false;

  # Do not start `gnome-keyring` in `--login` mode because it exports
  # `SSH_AUTH_SOCK` pointing to a non-existing socket, which prevents ssh from
  # connecting to a running ssh agent.
  #
  # See `man gnome-keyring-daemon(1)`
  security.pam.services.greetd.enableGnomeKeyring = false;

  # Enable the fish shell.
  programs.fish.enable = true;

  # Daemonless container engine for developing, managing, and running OCI
  # Containers. It is a drop-in replacement for the `docker` command.
  virtualisation.podman.enable = true;

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

  users.users.ah = {
    # Indicates whether this is an account for a real user. This automatically
    # sets `group` to "users", `createHome` to `true`, `home` to
    # "/home/username", `useDefaultShell` to `true`, and `isSystemUser` to
    # `false`. Exactly one of `isNormalUser` and `isSystemUser` must be true.
    isNormalUser = true;

    # Short description of the user account, typically the user's full name.
    description = "Alejandro Hernandez";

    shell = pkgs.fish;

    # Use `mkpasswd <pass>` to generate this hash.
    hashedPassword = "$6$asKE3fbnF.L$LddoU0RvwWISACYJsw2Jy3LLjCr.p/ss7W2nMNYkoR6E0WzY7afwxW9JmLoPuQmLvTUfIzVyujGuScSqQlog5.";

    extraGroups = [
      # The wheel group is a special user group used on some Unix systems to
      # control access to the su command.
      "wheel"
      # Allows users to control NetworkManager. For example to connect to new
      # networks.
      "networkmanager"
      # Allows users access to a video device, such as the laptop screen, which
      # is required to set the backlight for example.
      "video"
    ];
  };
}
