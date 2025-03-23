
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
        ./modules/steam.nix
        ./modules/xfce.nix
        ./hm.nix
        ./modules/networking.nix
      
        ];
        specialArgs = { inherit inputs; };

       };
      # Desktop
      nixosConfigurations.Chaucer = nixpkgs.lib.nixosSystem {
        modules = [ 
      
        ./global_config.nix
        ./hosts/Chaucer/configuration.nix
        ./modules/steam.nix
        ./modules/xfce.nix
        ./hm.nix
        ./modules/networking.nix
        ./modules/virtualization.nix

        ];
        specialArgs = { inherit inputs; };

       };
      # Server
      nixosConfigurations.Melville = nixpkgs.lib.nixosSystem {
        modules = [ 
      
        # ./server_config.nix
        ./global_config.nix
        ./hosts/Melville/configuration.nix
        ./hm.nix
        ./modules/minecraft.nix

        ];
        specialArgs = { inherit inputs; };

       };
    };
}
