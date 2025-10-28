# Lots of stuff:
# https://github.com/cosmic-utils/cosmic-project-collection

{ pkgs, ... }:

{
  imports = [ ../../../../../../shared/gui/brave.nix ];

  # May be able to replace with
  # https://github.com/cosmic-utils/clipboard-manager once it becomes
  # available in nixos.
  services.cliphist.enable = true;

  home.packages = [ pkgs.wl-clipboard ];

  # See https://wiki.nixos.org/wiki/COSMIC
  home.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
}
