{
  config,
  lib,
  modulesPath,
  ...
}:

{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/7ed43e50-ca07-4e99-a44c-4142230001b2";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/6E5A-1AC6";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/3fd60e39-7cf9-4e0f-99ea-1ec51243102b"; }
  ];
}
