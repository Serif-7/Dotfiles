{ inputs, ... }:

# This file exists to set some global HM options for all hosts
# if it didnt I would have to repeat this code in flake.nix which looks ugly
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
