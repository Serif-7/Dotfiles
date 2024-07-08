{ config, pkgs, ... }: {

  # System level configuration for all hosts

  nix.extraOptions = ''
    extra-experimental-features = nix-command flakes
    '';

  #set default shell to fish
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  users.users.daniel.shell = pkgs.fish;

    # added 5/28/2024 because one of the installed
  # packages' electron versio was declared EOL
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
    ];



}
