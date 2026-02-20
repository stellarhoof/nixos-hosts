# See https://sw.kovidgoyal.net/kitty/conf
{
  config,
  pkgs,
  ...
}:

{
  programs.kitty.enable = true;

  programs.kitty.settings = {
    kitty_mod = "cmd";

    # Default cursor color; render as "reverse video"
    cursor = "none";
    # Do not blink cursor
    cursor_blink_interval = 0;

    # Underline URLs on hover
    url_style = "single";
    # Copy selected text to clipboard automatically
    copy_on_select = "yes";
    # Remove EOL spaces when copying to clipboard
    strip_trailing_spaces = "smart";

    # hide_window_decorations = "titlebar-only";

    # Render tab bar at the top of the kitty window
    tab_bar_edge = "top";
    # This is the style that looks best IMO
    tab_bar_style = "powerline";
    tab_powerline_style = "slanted";
    # Render tab bar to the right
    tab_bar_align = "right";
    # Render active tab in bold font
    active_tab_font_style = "bold";

    # No default shortcuts; instead define them all manually
    clear_all_shortcuts = "yes";

    confirm_os_window_close = 1;
    # https://github.com/kovidgoyal/kitty/pull/3308
    macos_quit_when_last_window_closed = "yes";
    # Use display's native colorspace
    macos_colorspace = "default";
    # macos_thicken_font = "0.1";
    macos_option_as_alt = "yes";
  };

  programs.kitty.keybindings = {
    # Clipboard
    "kitty_mod+c" = "copy_to_clipboard";
    "kitty_mod+v" = "paste_from_clipboard";

    # Window management
    "kitty_mod+enter" = "launch --cwd=current --location=vsplit";
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
    "kitty_mod+i" = "next_layout";

    # Misc
    "kitty_mod+r" = "load_config_file";
    "kitty_mod+ctrl+f" = "toggle_fullscreen";
    "kitty_mod+ctrl+m" = "toggle_maximized";
  };

  programs.kitty.extraConfig = ''
    font_family PragmataPro Liga

    font_size 17
    modify_font cell_width -1px
    modify_font cell_height 9px

    undercurl_style thick-sparse
    modify_font underline_position 2
    modify_font underline_thickness 100%

    enabled_layouts horizontal,vertical,fat,grid,splits,stack,tall
  '';
}
