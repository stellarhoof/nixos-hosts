{ ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;

  # Whether the installation process is allowed to modify EFI boot
  # variables.
  boot.loader.efi.canTouchEfiVariables = true;

  # Delete files in /tmp during boot.
  boot.tmp.cleanOnBoot = true;
}
