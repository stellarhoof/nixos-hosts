{
  pkgs,
  ...
}:
{
  programs.brave.enable = true;
  programs.brave.extensions = [
    { id = "dbepggeogbaibhgnhhndojpepiihcmeb"; } # Vimium
    { id = "annajfchloimdhceglpgglpeepfghfai"; } # Tanstack Query
  ];
}
