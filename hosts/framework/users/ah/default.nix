{ config, ... }:

{
  imports = [
    ../../../../shared/terminal/default.nix
    ./desktops/cosmic/default.nix
    # ./desktops/hyprland/default.nix
    # ./desktops/niri/default.nix
    ./email.nix
  ];

  home.username = "ah";
  home.homeDirectory = "/home/ah";
  home.stateVersion = "26.05";

  home.sessionVariables = {
    # Hint electron apps to use Wayland
    NIXOS_OZONE_WL = "1";
    # Use wayland in GTK apps.
    GDK_BACKEND = "wayland";
    # Use wayland in QT apps.
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_QPA_PLATFORMTHEME_QT6 = "qt6ct";
    # Use wayland in SDL2 app. Remove or set to x11 if games that provide
    # older versions of SDL cause compatibility issues.
    SDL_VIDEODRIVER = "wayland";
    # Force Clutter applications to use their wayland backend.
    CLUTTER_BACKEND = "wayland";
  };

  # Manage XDG base directories with home-manager
  xdg.enable = true;

  # Whether to enable automatic creation of the XDG user directories.
  # https://wiki.archlinux.org/title/XDG_user_directories
  xdg.userDirs.enable = true;
  xdg.userDirs.createDirectories = true;
  xdg.userDirs.setSessionVariables = true;

  # Do not create these directories
  xdg.userDirs.desktop = null;
  xdg.userDirs.publicShare = null;
  xdg.userDirs.templates = null;

  # Create these custom directories
  xdg.userDirs.NOTES = "${config.home.homeDirectory}/Notes";
}
