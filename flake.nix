# nix flake --help
# Update all inputs: `nix flake update`
# Update single input: `nix flake lock --update-input <name>`
# Inspect value of configuration option: `nixos-option <name>`

{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    neovim-overlay.url = "github:nix-community/neovim-nightly-overlay";
    neovim-overlay.inputs.nixpkgs.follows = "nixpkgs";

    niri.url = "github:sodiboo/niri-flake";
  };
  outputs =
    inputs@{
      self,
      nixpkgs,
      nixos-hardware,
      ...
    }:
    {
      nixosConfigurations.framework = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          # https://github.com/NixOS/nixos-hardware/blob/master/framework
          nixos-hardware.nixosModules.framework-11th-gen-intel
          ./hosts/framework/default.nix
        ];
      };
    };
}
