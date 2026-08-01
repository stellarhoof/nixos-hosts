{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    # https://github.com/NixOS/nixos-hardware/blob/master/framework
    inputs.nixos-hardware.nixosModules.framework-13-7040-amd
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

  # Default system packages
  environment.systemPackages = with pkgs; [
    clang # More modern C compiler
    gcc # The standard C compiler
    gnumake # The standard build system
    cmake # More modern build system
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?
}
