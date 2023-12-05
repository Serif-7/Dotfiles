
{ config, pkgs, ... }:

{
  imports = [
    ./helix.nix
    ./fish.nix
  ];

  home = {
    /* The home.stateVersion option does not have a default and must be set */
    stateVersion = "18.09";
    /* Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ]; */
    packages = with pkgs; [

      # System Tools
      file
      fd
      ripgrep
      unzip
      zip
      xdg-utils

      # User Programs
      neovim
      discord
      helix
      fish
      eza
      obsidian
      mullvad-vpn
      steam
      spotify

      # Dev Tools
      git
      nim2
      godot_4

      # Network Tools
      httpie
      wireshark
      tcpdump
      socat
      wget
      curl

      # Hacker Tools
      nmap
      ffuf
      feroxbuster
      burpsuite
      hashcat
      john
      metasploit
      sqlmap
      aircrack-ng
      wifite2
      thc-hydra
    
    ];

  };
}
