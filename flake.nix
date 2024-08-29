
{
  description = "Serif's NixOS config";

  # https://wiki.nixos.org/wiki/Flakes

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

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:

    {
      # Laptop
      nixosConfigurations.Yeats = nixpkgs.lib.nixosSystem {
        modules = [ 

        ./global_config.nix
        ./hosts/Yeats/configuration.nix
        ./configs/steam.nix
        ./hm.nix
      
        ];
        specialArgs = { inherit inputs; };

       };
      # Desktop
      nixosConfigurations.Chaucer = nixpkgs.lib.nixosSystem {
        modules = [ 
      
        ./global_config.nix
        ./hosts/Chaucer/configuration.nix
        ./configs/steam.nix
        ./hm.nix

        ];
        specialArgs = { inherit inputs; };

       };
      # Desktop
      nixosConfigurations.Melville = nixpkgs.lib.nixosSystem {
        modules = [ 
      
        ./global_config.nix
        ./hosts/Melville/configuration.nix

        ];
        specialArgs = { inherit inputs; };

       };
    };
}
