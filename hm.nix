{ inputs, ... }:
{
  imports = [ inputs.home-manager.nixosModules.default ];
  home-manager = {
    useGlobalPkgs = true; # Global nixpkgs instance
    useUserPackages = true; # local user packages
    users.daniel.imports = [ ./home.nix ];
    extraSpecialArgs = {
      inherit inputs;
    };
  };
}
