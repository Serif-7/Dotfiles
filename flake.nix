
{
  description = "Daniel Gilleran's NixOS config";

  # plain attrset
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
      };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      };
  };

  # function that returns an attrset
  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    nixosConfigurations.Yeats = nixpkgs.lib.nixosSystem {
      modules = [ 
      
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
  };
}
