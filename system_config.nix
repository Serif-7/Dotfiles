{ config, pkgs, ... }: {

  # System level configuration for all hosts


  nix.extraOptions = ''
    extra-experimental-features = nix-command flakes
    '';
    
  #boot.loader.grub.enable = true;
  #boot.loader.grub.device = "nodev";
  #boot.loader.grub.useOSProber = true;  
  #boot.loader.grub.device = "nodev";
  # boot.loader.grub.extraEntries = ''
  #   menuentry "Windows 10" {
  #     chainloader (hd0,1)+1
  #   }
  # '';

  #set default shell to fish
  programs.fish.enable = true;
  users.users.daniel.shell = pkgs.fish;

    # added 5/28/2024 because one of the installed
  # packages' electron versio was declared EOL
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
    ];



}
