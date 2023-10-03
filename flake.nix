# nix flake --help
# Update all inputs: `nix flake update`
# Update single input: `nix flake lock --update-input <name>`
# Inspect value of configuration option: `nixos-option <name>`

{
  inputs = {
    # Using nixpkgs unstable to:
    # - Use hyprland via home-manager
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };
  outputs = { self, nixpkgs, nixos-hardware }: {
    nixosConfigurations.framework = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # https://github.com/NixOS/nixos-hardware/blob/master/framework
        nixos-hardware.nixosModules.framework
        ./hosts/framework/configuration.nix
        # Reuse `nixpkgs` input in the system-wide flake registry so commands
        # such as `nix shell nixpkgs#<pkg>` don't have to re-download it.
        { nix.registry.nixpkgs.flake = nixpkgs; }
      ];
    };
  };
}
