{
  inputs,
  config,
  pkgs,
  ...
}:

{
  imports = [
    inputs.matugen.nixosModules.default
  ];

  home.packages = [
    inputs.matugen.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  programs.matugen.templates = {
    foot = {
      input_path = ./templates/foot.ini;
      output_path = "${config.xdg.configHome}/foot/matugen.ini";
    };
    alacritty = {
      input_path = ./templates/alacritty.toml;
      output_path = "${config.xdg.configHome}/alacritty/matugen.toml";
    };
  };

  xdg.configFile."matugen/config.toml".source =
    (pkgs.formats.toml { }).generate "matugen-config.toml"
      {
        config = {
          custom_colors = {
            black = "#000000";
            red = "#800000";
            green = "#008000";
            yellow = "#808000";
            blue = "#000080";
            magenta = "#800080";
            cyan = "#008080";
            white = "#c0c0c0";
            bright_black = "#000000";
            bright_red = "#ff0000";
            bright_green = "#00ff00";
            bright_yellow = "#ffff00";
            bright_blue = "#0000ff";
            bright_magenta = "#ff00ff";
            bright_cyan = "#00ffff";
            bright_white = "#ffffff";
          };
        };
        templates = config.programs.matugen.templates;
      };

  programs.foot.settings = {
    colors2 = {
      alpha = 1.0;
    };
    main = {
      dpi-aware = "no";
      font = "JetBrains Mono:size=10";
      include = config.programs.matugen.templates.foot.output_path;
    };
  };
}
