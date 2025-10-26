{ pkgs, config, ... }:

{
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  environment.cosmic.excludePackages = with pkgs; [
    cosmic-edit
  ];
}
