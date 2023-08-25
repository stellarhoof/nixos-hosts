{ pkgs, config, ... }: {
  # Default system packages
  environment.systemPackages = with pkgs; [
    clang # More modern C compiler
    cmake # More modern build system
    fzf # Fuzzy finder for the terminal
    gcc # The standard C compiler
    git # Standard version control
    gnumake # The standard build system
    home-manager # So users can install their own configs
    nixfmt # Format nix files
    nodejs # Node
    python3 # Python
    ripgrep # Better grep
    tree # Tree listing of directories
    unzip # ZIP files extractor
  ];

  # Set screen backlight
  # brillo -S 20 -> set to 20%
  # brillo -G -> get current level
  hardware.brillo.enable = true;

  # command-not-found fails with some error about an sqlite database, so use
  # nix-index instead, which is better anyway.
  programs.command-not-found.enable = false;
  programs.nix-index.enable = true;

  # Install neovim and set as the default editor for everything.
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
  programs.neovim.viAlias = true;
  programs.neovim.vimAlias = true;

  # A DBus system that allows applications to update firmware.
  services.fwupd.enable = true;

  # Whether to start the ssh agent when you login. The OpenSSH agent stores
  # SSH private keys for the user session.
  programs.ssh.startAgent = true;

  # Whether to start the gpg agent when you login. The GnuPG agent remembers
  # stores GPG private keys for the user session.
  programs.gnupg.agent.enable = true;

  # This file should be created by the gnupg module in NixOS when
  # `programs.gnupg.agent.pinentryFlavor` is set but it's not working for some
  # reason so I'm creating it manually.
  environment.etc."gnupg/gpg-agent.conf".text = ''
    pinentry-program ${pkgs.pinentry.tty}/bin/pinentry
  '';
}
