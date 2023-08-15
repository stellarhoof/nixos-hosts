{ pkgs, config, ... }: {
  # Default system packages
  environment.systemPackages = with pkgs; [
    git # Necessary for flakes and pushing changes upstream
    neovim # Better vim
    brightnessctl
  ];

  # Setup nvim as the default editor for everything.
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

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

  services.actkbd.enable = true;

  services.actkbd.bindings = [ ];
}