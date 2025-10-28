{ config, ... }:

{
  imports = [
    ../../../../shared/terminal/default.nix
    ../../../../shared/gui/alacritty.nix
    # ./desktops/hyprland/default.nix
    # ./desktops/niri/default.nix
    ./desktops/cosmic/default.nix
  ];

  home.username = "ah";
  home.homeDirectory = "/home/ah";
  home.stateVersion = "25.05";

  # Manage XDG base directories with home-manager
  xdg.enable = true;

  # Whether to enable automatic creation of the XDG user directories.
  # https://wiki.archlinux.org/title/XDG_user_directories
  xdg.userDirs.enable = true;
  xdg.userDirs.createDirectories = true;

  # Do not create these directories
  xdg.userDirs.desktop = null;
  xdg.userDirs.publicShare = null;
  xdg.userDirs.templates = null;

  # Create these custom directories
  xdg.userDirs.extraConfig = {
    XDG_CODE_DIR = "${config.home.homeDirectory}/Code";
    XDG_NOTES_DIR = "${config.home.homeDirectory}/Notes";
  };
}
