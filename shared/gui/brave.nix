{ ... }:
{
  # Enable playing DRM content by enabling Widevine in "Settings > Extensions >
  # Widevine"
  programs.brave.enable = true;

  programs.brave.extensions = [
    { id = "dbepggeogbaibhgnhhndojpepiihcmeb"; } # Vimium
    { id = "annajfchloimdhceglpgglpeepfghfai"; } # Tanstack Query
  ];
}
