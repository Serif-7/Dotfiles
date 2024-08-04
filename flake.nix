
{
  description = "Serif's NixOS config";

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
  };

  # function that returns an attrset
  outputs = inputs@{ self, nixpkgs, home-manager, ... }:

    {
      nixosConfigurations.Yeats = nixpkgs.lib.nixosSystem {
        modules = [ 

        ./global_config.nix
        ./hosts/Yeats/configuration.nix
        ./configs/steam.nix
        ./hm.nix
      
        ];
        specialArgs = { inherit inputs; };

       };
      nixosConfigurations.Chaucer = nixpkgs.lib.nixosSystem {
        modules = [ 
      
        ./global_config.nix
        ./hosts/Chaucer/configuration.nix
        ./configs/steam.nix
        ./hm.nix

        ];
        specialArgs = { inherit inputs; };

       };
    };
}
