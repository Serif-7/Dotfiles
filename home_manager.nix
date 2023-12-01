
{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.daniel = {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "18.09";
    /* Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ]; */
    home.packages = with pkgs; [

      neovim
      wget
      discord
      helix
      fish
      eza
      godot_4
      obsidian
      mullvad-vpn

      # Dev Tools
      git
      gh

      # Hacker Tools
      nmap
      ffuf
      feroxbuster
      burpsuite
      hashcat
      john
      metasploit-framework
      sqlmap
      aircrack-ng
      wifite
      hydra
      wireshark
      
    ]

    
  };
}
