{ config, pkgs, ... }:
let
  ttl = 60480000;
in
{
  # Enable and manage gpg configuration
  programs.gpg.enable = true;

  # Declutter $HOME
  programs.gpg.homedir = "${config.xdg.stateHome}/gnupg";

  # Manage agent configuration with home-manager
  services.gpg-agent.enable = true;

  services.gpg-agent.pinentry.package = (
    if pkgs.stdenv.isDarwin then pkgs.pinentry_mac else pkgs.pinentry-tty
  );

  # Support SSH authentication via the gpg daemon.
  services.gpg-agent.enableSshSupport = true;

  # Cache decrypted keys for a long time
  services.gpg-agent.defaultCacheTtl = ttl;
  services.gpg-agent.defaultCacheTtlSsh = ttl;
  services.gpg-agent.maxCacheTtl = ttl;
  services.gpg-agent.maxCacheTtlSsh = ttl;

}
