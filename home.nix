
{ config, pkgs, ... }:

# home manager profile for serif

{
  imports = [
    # ./configs/helix.nix
    ./configs/sway.nix
    ./configs/fish.nix
    ./configs/tealdeer.nix
    ./configs/alacritty.nix
    ./configs/zathura.nix
    # ./configs/flameshot.nix
  ];

  programs.home-manager.enable = true;

  
  # XDG and home file config
  # xdg.enable = true;
  # xdg.configHome = "${config.home.homeDirectory}/.config";
  # xdg.configFile."../.lldbinit".source = ./configs/lldbinit;
  # xdg.configFile."./helix/config.toml".source = ./configs/helix.toml;
  home.file.".lldbinit".source = ./configs/lldbinit;
  home.file."./.config/helix/config.toml".source = ./configs/helix/helix.toml;
  # home.file."./.config/swat/config".source = ./configs/sway/config;

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

      # Libraries
      SDL2

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
      # nyxt # emacs-like browser
        # still fails to build as of 8/06/2024
      pandoc
      tor-browser
      kdePackages.konversation # IRC client
      neofetch
      chromium
      foliate # eBook reader
      yt-dlp
      home-manager # standalone tool for managing HM config
      uxn
      openmw
      portmod
      image-roll # image viewer
      jrnl
      telegram-desktop
      kdePackages.okular # PDF reader
      element-desktop
      age # encryption tool
      xfce.thunar # File Manager

      # Color Pickers
      gpick
      xcolor
      wl-color-picker
      epick
      

      # Window Manager
      sway
      grim
      slurp
      flameshot
      # mako
      swaynotificationcenter # notification daemon
      wofi
      swayidle
      swaybg
      swaylock
      waybar
      bemenu
      # hyprland

      # Office
      libreoffice
      focuswriter

      # Languages
      zig
      gcc
      ruby
      lua
      rustc
      nim2
      python3
      go
      sbcl # Common Lisp
      racket # includes DrRacket

      # Dev Tools
      git
      gitless # alternative git interface
      godot_4
      love
      cargo
      libgcc
      gdb
      docker
      lua-language-server
      zls # Zig Language Server
      nil # Nix Language Server
      lldb #debugger
      delve # go debugger
      direnv

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
      imhex # hex editor
      dsniff # Collection of programs including a TCP sniffer
    
    ];

    sessionVariables = {
      EDITOR = "hx";
      TERMINAL = "alacritty";
      PAGER = "most";
    };

  };

}
