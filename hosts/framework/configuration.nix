{ pkgs, config, ... }: {
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./console.nix
    ./graphical.nix
    ./hardware-configuration.nix
    ./network.nix
    ./overlays.nix
    ./programs.nix
    ./users.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;

  # Whether the installation process is allowed to modify EFI boot
  # variables.
  boot.loader.efi.canTouchEfiVariables = true;

  # Delete files in /tmp during boot.
  boot.tmp.cleanOnBoot = true;

  # Whether to enable OpenGL drivers. This is needed to enable OpenGL
  # support in X11 systems, as well as Wayland compositors.
  hardware.opengl.enable = true;

  # Self-explanatory
  time.timeZone = "America/New_York";

  # Daemonless container engine for developing, managing, and running OCI
  # Containers. It is a drop-in replacement for the `docker` command.
  virtualisation.podman.enable = true;

  # Allow installing unfree packages. This does not allow unfree packages for
  # individual users though; they have to opt-in in `~/.config/nixpkgs/config.nix`.
  nixpkgs.config.allowUnfree = true;

  # Configuration for `nix` the package manager. See `nix.conf(5)`
  nix.settings.experimental-features = "flakes nix-command";

  # Keep outputs and derivations is useful so cached builds of
  # development shells do not get garbage collected.
  # Do not delete outputs of non GC roots. 
  nix.settings.keep-outputs = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
