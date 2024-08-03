
{
  description = "Daniel Gilleran's NixOS config";

  # https://wiki.nixos.org/wiki/Flakes

  # plain attrset
  inputs = {
    nixpkgs = {
      #unstable is not cached
      url = "github:nixos/nixpkgs/nixos-unstable";
      };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      };
    # Zig overlay
    zig-overlay = {
      url = "github:mitchellh/zig-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # function that returns an attrset
  outputs = inputs@{ self, nixpkgs, home-manager, zig-overlay, ... }:

    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          zig-overlay.overlays.default
        ];
      };
    in {
      nixosConfigurations.Yeats = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ 

        ./global_config.nix
        ./hosts/Yeats/configuration.nix
        ./configs/steam.nix
      
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true; # Global nixpkgs instance
          home-manager.useUserPackages = true; # local user packages
          home-manager.users.daniel = import ./home.nix;
          }
        ];
        specialArgs = { inherit inputs; };

       };
      nixosConfigurations.Chaucer = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ 
      
        ./global_config.nix
        ./hosts/Chaucer/configuration.nix
        ./configs/steam.nix
      
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true; # Global nixpkgs instance
          home-manager.useUserPackages = true; # local user packages
          home-manager.users.daniel = import ./home.nix;
          home-manager.extraSpecialArgs = { inherit zig-overlay; };
          }
        ];
        specialArgs = { inherit inputs; };

       };
      # overlays.default = [(prev: next: {zig = zig.packages.master;}];
    };
}
