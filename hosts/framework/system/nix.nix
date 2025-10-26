{
  lib,
  inputs,
  ...
}:

{
  # Allow installing unfree packages. This does not allow unfree packages for
  # individual users though; they have to opt-in to this behavior in
  # `~/.config/nixpkgs/config.nix`.
  nixpkgs.config.allowUnfree = true;

  # # command-not-found fails with some error about an sqlite database, so use
  # # nix-index instead, which is better anyway.
  # programs.command-not-found.enable = false;
  # programs.nix-index.enable = true;

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
    # These users have additional rights when connecting to the nix daemon.
    trusted-users = [ "ah" ];
    # Keep outputs and derivations so cached builds of development shells do not
    # get garbage collected.
    # keep-outputs = true;
    # Enable flakes.
    experimental-features = "flakes nix-command";
  };
}
