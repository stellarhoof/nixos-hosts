{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ../../../../shared/terminal/default.nix
    ../../../../shared/gui/brave.nix
    ./programs/ghostty.nix
    ./programs/kitty.nix
  ];

  home.stateVersion = "25.05";
  home.username = "ah";
  home.homeDirectory = "/Users/ah";
  home.sessionPath = [ "${config.home.homeDirectory}/.docker/bin" ];

  # https://en.wikipedia.org/wiki/List_of_GNU_Packages
  home.packages = with pkgs; [
    coreutils # fileutils, textutils, shellutils
    findutils # find, locate, locatedb, xargs
    diffutils # diff, cmp
    gnugrep
    openssh
    less
  ];

  # Manage $XDG_* variables
  xdg.enable = true;

  programs.fish.loginShellInit = ''
    # Add homebrew path
    fish_add_path -pP /opt/homebrew/bin

    # Fish login shells emulate the behavior of `/usr/libexec/path_helper` in
    # MacOS, which is to prepend everything in `/etc/paths` to `$PATH`, which
    # hides NIX paths. This moves those paths to the end.
    fish_add_path -maP /usr/local/bin /usr/bin /bin /usr/sbin /sbin
  '';

  # MacOS uses zsh as its default shell.
  #
  # Paste this in `/etc/.zshrc` after a new MacOS upgrade
  #
  # ```
  # # Nix
  # if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  #   . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
  # fi
  # # End Nix
  # ```
  programs.zsh.enable = true;
  programs.zsh.dotDir = "${config.xdg.configHome}/zsh";
  programs.zsh.loginExtra = ''
    # https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/

    # By now `/etc/zshrc` has been sourced and the nix environment has been
    # setup so we can replace zsh with fish and the latter will inherit the
    # environment. This way we can avoid fish plugins such as fenv. See
    # https://github.com/NixOS/nix/issues/1512#issuecomment-1135984386.

    # This is done here instead of `zshrc` to avoid exec(ing) `fish` on
    # non-login shells so users can run `zsh` and get what they expect.
    exec ${config.programs.fish.package}/bin/fish -l
  '';
}
