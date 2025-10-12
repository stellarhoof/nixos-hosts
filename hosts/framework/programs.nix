{
  pkgs,
  inputs,
  config,
  ...
}:
{
  # Default system packages
  environment.systemPackages = with pkgs; [
    clang # More modern C compiler
    cmake # More modern build system
    eza # Better ls, including tree listing
    fzf # Fuzzy finder for the terminal
    gcc # The standard C compiler
    git # Standard version control
    gnumake # The standard build system
    home-manager # So users can install their own configs
    mongosh # Mongo shell
    nixfmt # Format nix files
    nodejs # Node
    python3 # Python
    ripgrep # Better grep
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
  programs.neovim.withPython3 = false;
  programs.neovim.withRuby = false;
  # programs.neovim.package = inputs.neovim-overlay.packages.${pkgs.system}.default;

  # Whether to start the ssh agent when you login. The OpenSSH agent stores
  # SSH private keys for the user session.
  programs.ssh.startAgent = true;

  # Whether to start the gpg agent when you login. The GnuPG agent remembers
  # stores GPG private keys for the user session.
  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.pinentryFlavor = "tty";

  # A DBus system that allows applications to update firmware.
  services.fwupd.enable = true;

  # services.mongodb.enable = true;
  # services.redis.enable = true;
}
