{ pkgs, inputs, ... }:

{
  imports = [
    inputs.niri.homeModules.niri
    inputs.dms.homeModules.niri
    inputs.dms.homeModules.dank-material-shell
    ../../../../../../shared/gui/brave.nix
    ../../programs/stylix.nix
    # ../../programs/matugen/default.nix
    ./keybinds.nix
  ];

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  # Enable the Niri Wayland compositor. This is required even when enabling
  # it at the system level.
  programs.niri.enable = true;

  # Use the niri package from the overlay above.
  programs.niri.package = pkgs.niri-unstable;

  # Ask applications to omit client side decorations.
  programs.niri.settings.prefer-no-csd = true;

  programs.niri.settings.gestures.hot-corners.enable = false;

  programs.niri.settings.outputs."PNP(BNQ) BenQ PD3220U XAL05492019" = {
    scale = 2.0;
    focus-at-startup = true;
  };

  # Wait for https://github.com/sodiboo/niri-flake/pull/1403
  # programs.niri.settings.outputs."eDP-1" = {
  #   layout = {
  #     gaps = 0;
  #     struts = {
  #       left = 0;
  #       right = 0;
  #       top = 0;
  #       bottom = 0;
  #     };
  #   };
  # };

  programs.niri.settings.input.keyboard = {
    repeat-rate = 30;
    repeat-delay = 250;
    xkb.options = "ctrl:nocaps";
  };

  programs.niri.settings.input.touchpad = {
    dwt = true; # Disable while typing
    natural-scroll = false;
  };

  programs.niri.settings.layout = {
    gaps = 0;
    struts = {
      left = 0;
      right = 0;
      top = 0;
      bottom = 0;
    };
    focus-ring = {
      enable = false;
    };
    border = {
      enable = true;
      width = 4;
    };
    default-column-width = {
      proportion = 0.5;
    };
    preset-column-widths = [
      { proportion = 0.3; }
      { proportion = 0.5; }
      { proportion = 0.7; }
      { proportion = 1.0; }
    ];
    preset-window-heights = [
      { proportion = 0.3; }
      { proportion = 0.5; }
      { proportion = 0.7; }
      { proportion = 1.0; }
    ];
  };

  programs.dank-material-shell.enable = true;
  programs.dank-material-shell.enableDynamicTheming = false;
  programs.dank-material-shell.niri.enableSpawn = true;

  # Terminal
  programs.foot.enable = true;

  # Browser
  programs.firefox.enable = true;
  programs.firefox.profiles.default.extensions.force = true;

  home.packages = with pkgs; [ wl-clipboard ];
}
