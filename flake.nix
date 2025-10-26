# See `nix flake --help`
#
# ```
# # Update all inputs
# nix flake update
#
# # Update single input
# nix flake lock --update-input <name>
#
# # Inspect value of configuration option
# nixos-option {option}
#
# # Try this configuration out by running
# nixos-rebuild --flake . build-vm
# ```

{
  nixConfig = {
    # A substituter is an additional nix store from which Nix can
    # obtain store objects instead of building them.
    #
    # See `nix.conf(5)`
    extra-substituters = [
      "https://niri.cachix.org"
      "https://hyprland.cachix.org"
    ];
    extra-trusted-public-keys = [
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    neovim-overlay.url = "github:nix-community/neovim-nightly-overlay";
    neovim-overlay.inputs.nixpkgs.follows = "nixpkgs";

    # Do not override the nixpkgs input for these flakes as it will
    # disable the cachix cache for them. Not sure why but trust me.
    niri.url = "github:sodiboo/niri-flake";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixos-hardware,
      home-manager,
      neovim-overlay,
      niri,
      hyprland,
    }:
    {
      nixosConfigurations.framework = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inputs = {
            inherit
              nixpkgs
              nixos-hardware
              home-manager
              niri
              hyprland
              ;
          };
        };
        modules = [ ./hosts/framework/system/default.nix ];
      };

      homeConfigurations."ah@framework" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
        };
        extraSpecialArgs = {
          inputs = {
            inherit
              nixpkgs
              neovim-overlay
              niri
              hyprland
              ;
          };
        };
        modules = [ ./hosts/framework/users/ah/default.nix ];
      };

      homeConfigurations."ah@mbpro" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "aarch64-darwin";
        };
        extraSpecialArgs = {
          inputs = {
            inherit
              nixpkgs
              home-manager
              neovim-overlay
              ;
          };
        };
        modules = [ ./hosts/mbpro/users/ah/default.nix ];
      };
    };
}
