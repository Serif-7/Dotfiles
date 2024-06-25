{ config, pkgs, ... }: {

  # System level configuration for all hosts

  nix.extraOptions = ''
    extra-experimental-features = nix-command flakes
    '';

  #set default shell to fish
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  users.users.daniel.shell = pkgs.fish;

}
