
{
  description = "Daniel Gilleran's NixOS config";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
      };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    nixosConfigurations.Yeats = nixpkgs.lib.nixosSystem {
      modules = [ 
      
      ./configuration.nix 
      
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true; # Global nixpkgs instance
        home-manager.useUserPackages = true; # local user packages
        home-manager.users.daniel = import ./home-manager.nix;
        }
      ];
      specialArgs = { inherit inputs; };

     };
  };
}
