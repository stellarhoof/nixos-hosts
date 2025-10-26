{ pkgs, inputs, ... }:

{
  imports = [
    inputs.niri.homeModules.niri
    # inputs.niri.homeModules.stylix
  ];

  programs.niri.enable = true;

  programs.niri.settings.outputs."PNP(BNQ) BenQ PD3220U XAL05492019" = {
    scale = 2.0;
  };

  programs.niri.settings.input.keyboard = {
    repeat-rate = 30;
    repeat-delay = 250;
    xkb.options = "ctrl:nocaps";
  };

  programs.niri.settings.binds = {
    "Mod+Return".action.spawn = [ "foot" ];
    "Mod+b".action.spawn = [ "firefox" ];
  };

  # Terminal
  programs.foot.enable = true;

  # Notifications daemon
  services.mako.enable = true;
}
