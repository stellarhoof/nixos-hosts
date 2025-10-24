{
  pkgs,
  config,
  inputs,
  ...
}:
{
  imports = [
    # Hardware
    ./filesystem.nix
    ./networking.nix
    ./audio.nix
    ./bluetooth.nix
    # Booting
    ./boot.nix
    # Linux TTY
    ./console.nix
    ./users.nix
    ./graphical.nix
  ];

  # Self-explanatory
  time.timeZone = "America/New_York";

  # A DBus system that allows applications to update firmware.
  services.fwupd.enable = true;

  # Set screen backlight
  # brillo -S 20 -> set to 20%
  # brillo -G -> get current level
  hardware.brillo.enable = true;

  # TODO: Look into why this is needed. It came with the default hardware
  # configuration scan.
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # Daemonless container engine for developing, managing, and running OCI
  # Containers. It is a drop-in replacement for the `docker` command.
  virtualisation.podman.enable = true;

  # TODO: Not sure whether this is necessary. Perhaps the flake already sets
  # this configuration.
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # Allow installing unfree packages. This does not allow unfree packages for
  # individual users though; they have to opt-in to this behavior in
  # `~/.config/nixpkgs/config.nix`.
  nixpkgs.config.allowUnfree = true;

  # Default system packages
  environment.systemPackages = with pkgs; [
    clang # More modern C compiler
    gcc # The standard C compiler
    gnumake # The standard build system
    cmake # More modern build system
  ];

  # # command-not-found fails with some error about an sqlite database, so use
  # # nix-index instead, which is better anyway.
  # programs.command-not-found.enable = false;
  # programs.nix-index.enable = true;

  # # Whether to start the ssh agent when you login. The OpenSSH agent stores
  # # SSH private keys for the user session.
  # programs.ssh.startAgent = true;

  # # Whether to start the gpg agent when you login. The GnuPG agent remembers
  # # stores GPG private keys for the user session.
  # programs.gnupg.agent.enable = true;
  # programs.gnupg.agent.pinentryFlavor = "tty";

  # Flake registries are a convenience feature that allows you to refer to
  # flakes using symbolic identifiers such as `nixpkgs`, rather than full URLs.
  # You can use these identifiers on the command line (e.g. `nix run
  # nixpkgs#hello`) or in flake input specifications in `flake.nix` files. The
  # latter are automatically resolved to full URLs and recorded in `flake.lock`.
  #
  # There are multiple registries
  # - The global registry, downloaded from `https://github.com/NixOS/flake-registry`
  # - The system registry, shared by all users and located at `/etc/nix/registry.json`
  #   It can be specified using the NixOS option `nix.registry`.
  # - The user registry, located at `~/.config/nix/registry.json`, which specified
  #   via the home-manager option `nix.registry`.
  #
  # The system and user registries are only used to resolve flakes in the
  # command line, not to resolve flake references in `flake.nix` files.
  #
  # See `nix3-registry(1)`
  nix.registry = {
    # Set the system registry's `nixpkgs` identifier to this flake's
    # `nixpkgs`
    # input.
    nixpkgs.flake = inputs.nixpkgs;
  };

  # Configuration for `nix` the package manager. See `nix.conf(5)`
  nix.settings = {
    # Keep outputs and derivations so cached builds of development shells do not
    # get garbage collected.
    keep-outputs = true;
    # Enable flakes.
    experimental-features = "flakes nix-command";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
