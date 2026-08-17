# See https://sw.kovidgoyal.net/kitty/conf
{ ... }:

let
  fonts = {
    jetbrains = ''
      font_family family='JetBrains Mono NL' style='Regular'
      bold_font family='JetBrains Mono NL' style='ExtraBold'
      italic_font family='JetBrains Mono NL' style='Regular Italic'
      bold_italic_font family='JetBrains Mono NL' style='ExtraBold Italic'

      font_size 15
      modify_font cell_height 17px
    '';

    sf = ''
      modify_font cell_width -1px

      font_family family='SF Mono' style='Regular'
      bold_font family='SF Mono' style='Bold'
      italic_font family='SF Mono' style='Regular Italic'
      bold_italic_font family='SF Mono' style='Bold Italic'

      font_size 15
      modify_font cell_height 21px
    '';

    operator = ''
      modify_font cell_width -1px

      font_family family='Operator Mono' style='Book'
      bold_font family='Operator Mono' style='Bold'
      italic_font family='Operator Mono' style='Book Italic'
      bold_italic_font family='Operator Mono' style='Bold Italic'

      font_size 16
      modify_font cell_height 18px
    '';

    fira = ''
      modify_font cell_width -1px

      font_family family='Fira Code' style='Regular'
      bold_font family='Fira Code' style='Bold'
      italic_font family='Fira Code' style='Regular'
      bold_italic_font family='Fira Code' style='Bold'

      font_size 15
      modify_font cell_height 20px
    '';
  };

  themes = {
    zenbonesDark = ''
      foreground                      #B4BDC3
      background                      #1C1917
      selection_foreground            #B4BDC3
      selection_background            #3D4042
      cursor                          #C4CACF
      cursor_text_color               #1C1917
      active_tab_foreground           #B4BDC3
      active_tab_background           #65435E
      inactive_tab_foreground         #B4BDC3
      inactive_tab_background         #352F2D
      # black
      color0 #1C1917
      color8 #403833
      # red
      color1 #DE6E7C
      color9 #E8838F
      # green
      color2  #819B69
      color10 #8BAE68
      # yellow
      color3  #B77E64
      color11 #D68C67
      # blue
      color4  #6099C0
      color12 #61ABDA
      # magenta
      color5  #B279A7
      color13 #CF86C1
      # cyan
      color6  #66A5AD
      color14 #65B8C1
      # white
      color7  #B4BDC3
      color15 #888F94
    '';

    zenbonesLight = ''
      foreground                      #2C363C
      background                      #E8E4E3
      selection_foreground            #2C363C
      selection_background            #CBD9E3
      cursor                          #2C363C
      cursor_text_color               #F0EDEC
      active_tab_foreground           #2C363C
      active_tab_background           #DEB9D6
      inactive_tab_foreground         #2C363C
      inactive_tab_background         #D6CDC9
      # black
      color0 #F0EDEC
      color8 #CFC1BA
      # red
      color1 #A8334C
      color9 #94253E
      # green
      color2  #4F6C31
      color10 #3F5A22
      # yellow
      color3  #944927
      color11 #803D1C
      # blue
      color4  #286486
      color12 #1D5573
      # magenta
      color5  #88507D
      color13 #7B3B70
      # cyan
      color6  #3B8992
      color14 #2B747C
      # white
      color7  #2C363C
      color15 #4F5E68
    '';
  };
in

{
  programs.kitty.enable = true;

  programs.kitty.darwinLaunchOptions = [
    "--start-as=maximized"
  ];

  programs.kitty.extraConfig = ''
    undercurl_style thick-sparse
    modify_font underline_position 2
    modify_font underline_thickness 100%
  ''
  + fonts.fira
  + themes.zenbonesLight;

  programs.kitty.settings = {
    kitty_mod = "cmd";

    enabled_layouts = "splits,stack";

    # Do not blink cursor
    cursor_blink_interval = 0;
    cursor_beam_thickness = 2;

    # Underline URLs on hover
    url_style = "single";
    # Copy selected text to clipboard automatically
    copy_on_select = "yes";
    # Remove EOL spaces when copying to clipboard
    strip_trailing_spaces = "smart";

    # Hide titlebar in macos
    hide_window_decorations = "titlebar-and-corners";

    # Render tab bar at the top of the kitty window
    tab_bar_edge = "top";
    # This is the style that looks best IMO
    tab_bar_style = "powerline";
    tab_powerline_style = "slanted";
    # Render active tab in bold font
    active_tab_font_style = "bold";

    # Do not draw borders around active panes
    active_border_color = "none";

    # No default shortcuts; instead define them all manually
    clear_all_shortcuts = "yes";

    macos_quit_when_last_window_closed = "yes";
    # Use display's native colorspace
    macos_colorspace = "default";
    macos_option_as_alt = "yes";
    text_composition_strategy = "legacy";

    # Nerd Fonts v3.4.0
    # See https://sw.kovidgoyal.net/kitty/faq/#kitty-is-not-able-to-use-my-favorite-font
    symbol_map = "U+e000-U+e00a,U+e0a0-U+e0a2,U+e0a3,U+e0b0-U+e0b3,U+e0b4-U+e0c8,U+e0ca,U+e0cc-U+e0d7,U+e200-U+e2a9,U+e300-U+e3e3,U+e5fa-U+e6b7,U+e700-U+e8ef,U+ea60-U+ec1e,U+ed00-U+efce,U+f000-U+f2ff,U+f300-U+f381,U+f400-U+f533,U+f0001-U+f1af0 Symbols Nerd Font Mono";
  };

  programs.kitty.keybindings = {
    # Clipboard
    "kitty_mod+c" = "copy_to_clipboard";
    "kitty_mod+v" = "paste_from_clipboard";

    # Window management
    "kitty_mod+enter" = "launch --cwd=current --location=vsplit";
    "kitty_mod+shift+enter" = "launch --cwd=current --location=hsplit";
    "kitty_mod+x" = "close_window";
    "kitty_mod+h" = "neighboring_window left";
    "kitty_mod+j" = "neighboring_window down";
    "kitty_mod+k" = "neighboring_window up";
    "kitty_mod+l" = "neighboring_window right";
    "kitty_mod+shift+h" = "move_window left";
    "kitty_mod+shift+j" = "move_window down";
    "kitty_mod+shift+k" = "move_window up";
    "kitty_mod+shift+l" = "move_window right";

    # Tab management
    "kitty_mod+[" = "previous_tab";
    "kitty_mod+]" = "next_tab";
    "kitty_mod+left" = "previous_tab";
    "kitty_mod+right" = "next_tab";
    "kitty_mod+shift+[" = "move_tab_backward";
    "kitty_mod+shift+]" = "move_tab_forward";
    "kitty_mod+t" = "new_tab_with_cwd";
    "kitty_mod+w" = "close_tab";

    # Fonts
    "kitty_mod+0" = "change_font_size all 0";
    "kitty_mod+equal" = "change_font_size all +1.0";
    "kitty_mod+minus" = "change_font_size all -1.0";

    # Layout management
    "kitty_mod+o" = "toggle_layout stack";

    # Sessions
    "kitty_mod+s" = "goto_session";
    "kitty_mod+shift+s" =
      "save_as_session --use-foreground-process --base-dir ~/.local/share/kitty/sessions";

    # Misc
    "kitty_mod+n" = "new_os_window";
    "kitty_mod+r" = "load_config_file";
    "kitty_mod+ctrl+f" = "toggle_fullscreen";
    "kitty_mod+ctrl+m" = "toggle_maximized";
  };

}
