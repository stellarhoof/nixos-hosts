{ ... }:

let
  fonts = {
    # `brew install font-sf-mono`.
    sfMono = {
      font-family = "SF Mono";
      # font-style = "Medium";
      # font-style-italic = "Medium Italic";
      # font-style-bold = "Heavy";
      # font-style-bold-italic = "Heavy Italic";
      adjust-cell-width = -1;
      # font-size = 15;
      # adjust-cell-height = 22;
      font-size = 16;
      adjust-cell-height = 20;
    };
    ibmPlex = {
      font-family = "IBM Plex Mono";
      adjust-cell-width = -1;
      # font-size = 15;
      # adjust-cell-height = 19;
      # font-size = 16;
      # adjust-cell-height = 16;
      font-size = 17;
      adjust-cell-height = 14;
    };
    iosevka = {
      # font-family = "Iosevka";
      font-family = "Iosevka Slab";
      adjust-cell-width = -1;
      font-size = 16;
      adjust-cell-height = 15;
    };
    monaSpace = {
      # font-family = "Monaspace Argon";
      # font-family = "Monaspace Krypton";
      font-family = "Monaspace Neon";
      # font-family = "Monaspace Radon";
      # font-family = "Monaspace Xenon";
      adjust-cell-width = -1;
      # font-size = 13;
      # adjust-cell-height = 4;
      # font-size = 13;
      # adjust-cell-height = 26;
      # font-size = 14;
      # adjust-cell-height = 1;
      font-size = 14;
      adjust-cell-height = 23;
      # font-size = 15;
      # adjust-cell-height = 21;
      font-feature = "calt"; # Supposedly turns on font healing
    };
    monoLisa = {
      font-family = "MonoLisa";
      adjust-cell-width = -2;
      # font-size = 12;
      # adjust-cell-height = 3;
      # font-size = 12;
      # adjust-cell-height = 25;
      # font-size = 13;
      # adjust-cell-height = 22;
      font-size = 14;
      adjust-cell-height = 19;
    };
    operatorMono = {
      font-family = "Operator Mono Medium";
      adjust-cell-width = -1;
      # font-size = 12;
      # adjust-cell-height = 7;
      # font-size = 12;
      # adjust-cell-height = 29;
      # font-size = 13;
      # adjust-cell-height = 5;
      # font-size = 13;
      # adjust-cell-height = 27;
      # font-size = 14;
      # adjust-cell-height = 2;
      # font-size = 14;
      # adjust-cell-height = 24;
      font-size = 15;
      adjust-cell-height = 22;
    };
    pragmataPro = {
      font-family = "PragmataPro Liga";
      adjust-cell-width = 0;
      # font-size = 13;
      # adjust-cell-height = 7;
      # font-size = 13;
      # adjust-cell-height = 29;
      # font-size = 14;
      # adjust-cell-height = 5;
      # font-size = 14;
      # adjust-cell-height = 27;
      # font-size = 15;
      # adjust-cell-height = 3;
      # font-size = 15;
      # adjust-cell-height = 25;
      # font-size = 16;
      # adjust-cell-height = 1;
      font-size = 16;
      adjust-cell-height = 23;
    };
  };
in
{
  # Ghostty is marked as broken in MacOS but the configuration is here for
  # reference purposes until it's fixed.
  programs.ghostty.enable = true;

  programs.ghostty.package = null;

  programs.ghostty.settings = fonts.sfMono // {
    # Font config
    adjust-underline-position = 4;
    adjust-underline-thickness = 2;

    # Maximize window on startup
    window-width = 1000;
    window-height = 1000;
    window-padding-x = 0;
    window-padding-y = 0;

    # Shell integration
    shell-integration = "fish";
    shell-integration-features = "no-cursor";
    window-inherit-font-size = true;
    window-inherit-working-directory = true;
    tab-inherit-working-directory = true;
    split-inherit-working-directory = true;

    # theme = "light:Nvim Light,dark:Nvim Dark";
    theme = "light:Zenbones Light,dark:Zenbones Dark";
    cursor-style-blink = false;
    unfocused-split-opacity = 1;
    mouse-hide-while-typing = true;
    window-theme = "auto";
    window-colorspace = "display-p3";
    window-padding-color = "extend";
    copy-on-select = "clipboard";
    macos-titlebar-style = "tabs";

    # Unbind default keybinds
    keybind = [
      "super+alt+left=unbind"
      "super+alt+down=unbind"
      "super+alt+up=unbind"
      "super+alt+right=unbind"
      "super+d=unbind"
      "super+shift+d=unbind"
      "ctrl+shift+tab=unbind"
      "super+shift+down=unbind"
      "super+shift+up=unbind"
      "ctrl+tab=unbind"

      # Custom keybinds
      "super+[=previous_tab"
      "super+]=next_tab"
      "super+shift+[=move_tab:-1"
      "super+shift+]=move_tab:+1"
      "super+enter=new_split:right"
      "super+shift+enter=new_split:down"
      "super+o=toggle_split_zoom"
      "super+h=goto_split:left"
      "super+j=goto_split:bottom"
      "super+k=goto_split:top"
      "super+l=goto_split:right"
    ];
  };
}
