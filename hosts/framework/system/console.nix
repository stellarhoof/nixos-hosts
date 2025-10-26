{ pkgs, config, ... }:

{
  # kmscon is a userpace VT (virtual terminal) with more features than the
  # standard linux console:
  # - Full unicode support
  # - True color support
  # - Fontconfig fonts
  # - xkb keyboard configuration
  services.kmscon.enable = false;

  # Setup font used by kmscon
  services.kmscon.fonts = [
    {
      name = "Iosevka";
      package = pkgs.iosevka;
    }
  ];

  # Unfortunately, nixpkgs does not install the manpage for kmscon, and the man
  # pages on the internet are for an old version of kmscon, so the most
  # up-to-date version is at
  # https://github.com/Aetf/kmscon/blob/develop/docs/man/kmscon.1.xml.in
  #
  # TODO: Use https://nix-community.github.io/stylix/options/modules/kmscon.html
  # instead.
  services.kmscon.extraConfig = ''
    # Default font size. Font size can still be changed using the following
    # keyboard shortcuts:
    #   <c--> : decrease font size
    #   <c-+> : increase font size
    font-size=18

    # Swap control and capslock keys
    xkb-options=ctrl:swapcaps,altwin:swap_lalt_lwin

    # Faster keyboard repeat rate and shorter delay before key repeats
    xkb-repeat-rate=30
    xkb-repeat-delay=250

    # Allow keyboard shortcuts to control sessions, which are sort of like
    # workspaces in a WM or virtual ttys. Information about default shortcuts
    # are in the manpage, replicated here for convenience:
    #   <c-logo-left>  : previous session
    #   <c-logo-right> : next session
    #   <c-logo-esc>   : dummy (blank) session (why? :/)
    #   <c-logo-bs>    : kill session
    #   <c-logo-enter> : new session
    session-control

    # Tokyonight palette
    palette=custom

    palette-background=26,27,38
    palette-foreground=192,202,245

    palette-black=26,27,38
    palette-red=219,75,75
    palette-green=158,206,106
    palette-yellow=224,175,104
    palette-blue=61,89,161
    palette-magenta=187,154,247
    palette-cyan=125,207,255
    palette-dark-grey=26,27,38

    palette-light-grey=169,177,214
    palette-light-red=247,118,142
    palette-light-green=195,232,141
    palette-light-yellow=224,175,104
    palette-light-blue=137,221,255
    palette-light-magenta=187,154,247
    palette-light-cyan=134,225,252
    palette-white=192,202,245
  '';
}
