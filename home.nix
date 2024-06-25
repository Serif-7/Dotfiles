
{ config, pkgs, ... }:

{
  imports = [
    ./configs/helix.nix
    ./configs/fish.nix
    ./configs/tealdeer.nix
    ./configs/alacritty.nix
    ./configs/zathura.nix
  ];

  programs.home-manager.enable = true;

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
      binutils
      gparted
      efibootmgr
      wl-clipboard

      # User Programs
      neovim
      discord
      helix
      fish
      eza
      obsidian
      calibre
      mullvad-vpn
      steam
      spotify
      qbittorrent
      alacritty
      anki
      mpv
      du-dust # disk usage viewer
      fzf
      ripgrep
      tealdeer
      bottom
      gping # ping with a graph
      procs # process viewer
      zoxide
      zathura # pdf reader
      most
      bat
      zellij
      #nyxt # emacs-like browser
      pandoc
      tor-browser
      kdePackages.konversation # IRC client
      neofetch
      chromium
      foliate # eBook reader
      youtube-dl
      wl-clipboard
      home-manager # standalone tool for managing HM config
      focuswriter
      libreoffice
      uxn
      openmw
      portmod
      image-roll # image viewer
      jrnl
      telegram-desktop
      zoxide
      kdePackages.okular # PDF reader
      

      # Dev Tools
      git
      nim2
      # nim2Packages.nimble
      godot_4
      love
      rustc
      cargo
      libgcc
      gcc
      gdb
      docker
      python3
      lua
      lua-language-server
      ruby
      zig
      zls
      lldb #debugger

      # Windows Stuff
      wineWowPackages.stable
      winetricks

      # Build Tools
      cmake
      gnumake

      # Network Tools
      httpie
      wireshark
      tcpdump
      socat
      wget
      curl
      dogdns # DNS client

      # Hacker Tools
      nmap
      ffuf
      feroxbuster # recursive content discovery tool
      burpsuite
      hashcat
      john # password cracker
      metasploit
      sqlmap
      aircrack-ng
      wifite2
      thc-hydra # network logon cracker
      imhex
      dsniff # Collection of programs including a TCP sniffer
    
    ];

    sessionVariables = {
      EDITOR = "hx";
      TERMINAL = "alacritty";
      PAGER = "most";
    };

  };
}
