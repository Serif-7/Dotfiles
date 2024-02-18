{ config, pkgs, ... }: {

  # System level configuration for all hosts


  nix.extraOptions = ''
    extra-experimental-features = nix-command flakes
    '';
    
  #boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;

  #set default shell to fish
  programs.fish.enable = true;
  users.users.daniel.shell = pkgs.fish;

}
