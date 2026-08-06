{ pkgs, inputs, ... }:

{
  programs.neovim.enable = true;
  programs.neovim.package = inputs.neovim-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default;
  programs.neovim.defaultEditor = true;
  programs.neovim.viAlias = true;
  programs.neovim.vimAlias = true;
  programs.neovim.sideloadInitLua = true;

  home.packages = with pkgs; [
    emmylua-ls # Lua language server
    jq # CLI JSON processor
    kulala-fmt # Formatter for HTTP files
    nixd # Nix language server
    nixfmt # Nix language formatter
    shfmt # Shell parser and formatter
    tailwindcss-language-server
    tree-sitter
    vscode-js-debug # DAP-compatible javascript debugger
    vtsls # LSP wrapper for typescript extension of vscode
  ];
}
