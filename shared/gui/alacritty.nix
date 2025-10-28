{
  config,
  pkgs,
  ...
}:

{
  programs.alacritty.enable = false;
  programs.alacritty.theme = "catppuccin_latte";
  programs.alacritty.settings = {
    window = {
      startup_mode = "Maximized";
    };
    font = {
      normal = {
        family = "PragmataPro Liga";
      };
      size = 17;
      offset = {
        x = -1;
        y = 14;
      };
      glyph_offset = {
        x = 0;
        y = 7;
      };
    };
  };
}
