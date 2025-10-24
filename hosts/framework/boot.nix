{ ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;

  # Whether the installation process is allowed to modify EFI boot
  # variables.
  boot.loader.efi.canTouchEfiVariables = true;

  # Delete files in /tmp during boot.
  boot.tmp.cleanOnBoot = true;

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "thunderbolt"
    "nvme"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
}
