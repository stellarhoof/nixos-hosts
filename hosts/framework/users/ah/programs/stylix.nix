{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.stylix.homeModules.stylix
  ];

  stylix.enable = true;

  stylix.image = ../wallpapers/zen-garden.png;

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/default-dark.yaml";
  stylix.fonts.sizes.terminal = 10;

  stylix.fonts.monospace.package = pkgs.jetbrains-mono;
  stylix.fonts.monospace.name = "JetBrains Mono";

  stylix.targets.neovim.enable = false;
  stylix.targets.foot.enable = false;
  stylix.targets.firefox.profileNames = [ "default" ];
  stylix.targets.firefox.colorTheme.enable = true;
}
