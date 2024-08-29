
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
  # waybar settings
  home.file."./.config/waybar/config.jsonc".source = ./configs/waybar/waybar.jsonc;
  # home.file."./.config/sway/config".source = ./configs/sway/config;

  # Fonts
  home.file."./.local/share/fonts/Fraktion.otf".source = ./fonts/fraktion.otf;

  home = {
    /* The home.stateVersion option does not have a default and must be set */
    stateVersion = "18.09";
    /* Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ]; */
    packages = with pkgs; [

      # System Tools
      file
      fd
      unzip
      zip
      xdg-utils
      binutils
      gparted
      efibootmgr
      wl-clipboard
      brightnessctl
      cacert
      kanata-with-cmd # keyboard remapping

      # Libraries
      SDL2
      raylib

      # CLI
      fish
      eza
      alacritty
      ripgrep
      du-dust # disk usage viewer
      tealdeer
      bottom
      gping # ping with a graph
      procs # process viewer
      zoxide
      most
      bat
      zellij
      neofetch
      yt-dlp
      jrnl
      age # encryption tool
      clipboard-jh # Clipboard Manager

      # User Programs
      obsidian
      calibre
      mullvad-vpn
      openvpn
      spotify
      qbittorrent
      anki
      mpv
      zathura # pdf reader
      pandoc
      home-manager # standalone tool for managing HM config
      uxn
      image-roll # image viewer
      xfce.thunar # File Manager
      wlsunset
      udiskie

      # Games
      steam
      openmw
      portmod

      # Browsers
      firefox
      chromium
      tor-browser
      # nyxt # emacs-like browser
        # still fails to build as of 8/06/2024

      # Messaging
      discord
      vesktop
      xwaylandvideobridge
      telegram-desktop
      element-desktop
      kdePackages.konversation # IRC client

      # Color Pickers
      gpick
      xcolor
      wl-color-picker
      epick
      

      # Window Manager
      sway
      grim
      slurp
      (flameshot.override { enableWlrSupport = true; })
      # mako
      swaynotificationcenter # notification daemon
      wofi
      swayidle
      swaybg
      swaylock
      waybar
      bemenu
      cliphist # Clipboard Manager
      wev # Wayland Event Viewer
      wshowkeys # show keys pressed (for supported wl compositors)
      # hyprland

      # Office
      libreoffice
      focuswriter
      foliate # eBook reader
      kdePackages.okular # PDF reader

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
      helix
      neovim
      fzf
      git
      gitless # alternative git interface
      godot_4
      love
      cargo
      libgcc
      docker
      ## Debuggers
      gdb
      lldb #debugger
      delve # go debugger
      direnv
      jq
      ## LSP
      lua-language-server
      zls # Zig Language Server
      nil # Nix Language Server
      ruby-lsp # Ruby Language Server

      # Windows Stuff
      wineWowPackages.stable
      winetricks

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
      ssh-audit # check for SSH vulns
    
    ];

    sessionVariables = {
      EDITOR = "hx";
      TERMINAL = "alacritty";
      PAGER = "most";
    };

  };

}
