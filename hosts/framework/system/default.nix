{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    # https://github.com/NixOS/nixos-hardware/blob/master/framework
    inputs.nixos-hardware.nixosModules.framework-11th-gen-intel
    ./audio.nix
    ./bluetooth.nix
    ./boot.nix
    ./console.nix
    ./networking.nix
    ./nix.nix
    ./users/ah/default.nix
  ];

  # Self-explanatory
  time.timeZone = "America/New_York";

  # A DBus system that allows applications to update firmware.
  services.fwupd.enable = true;

  # Default system packages
  environment.systemPackages = with pkgs; [
    clang # More modern C compiler
    gcc # The standard C compiler
    gnumake # The standard build system
    cmake # More modern build system
  ];

  # # Whether to start the ssh agent when you login. The OpenSSH agent stores
  # # SSH private keys for the user session.
  # programs.ssh.startAgent = true;

  # # Whether to start the gpg agent when you login. The GnuPG agent remembers
  # # stores GPG private keys for the user session.
  # programs.gnupg.agent.enable = true;
  # programs.gnupg.agent.pinentryFlavor = "tty";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
