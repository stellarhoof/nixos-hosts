# Lots of stuff:
# https://github.com/cosmic-utils/cosmic-project-collection

{ pkgs, ... }:

{
  imports = [ ../../../../../../shared/gui/brave.nix ];

  home.packages = with pkgs; [
    wl-clipboard
  ];

  # Terminals
  programs.foot.enable = true;
  programs.foot.settings = {
    csd.preferred = "none";
  };

  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    window.decorations = "None";
  };
}
