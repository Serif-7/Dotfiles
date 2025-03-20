{ config, pkgs, ... }:

# home manager profile for serif

{
  imports = [
    # ./configs/helix.nix
    ./hm_modules/sway.nix
    ./hm_modules/fish.nix
    ./hm_modules/tealdeer.nix
    ./hm_modules/alacritty.nix
    ./hm_modules/zathura.nix
    # ./configs/flameshot.nix
  ];

  programs.home-manager.enable = true;

  
  # XDG and home file config
  # xdg.enable = true;
  # xdg.configHome = "${config.home.homeDirectory}/.config";
  # xdg.configFile."../.lldbinit".source = ./configs/lldbinit;
  # xdg.configFile."./helix/config.toml".source = ./configs/helix.toml;
  home.file.".lldbinit".source = ./hm_modules/lldbinit;
  home.file.".gdbinit".source = ./hm_modules/gdbinit;
  home.file.".config/helix/config.toml".source = ./hm_modules/helix/helix.toml;
  home.file.".config/helix/languages.toml".source = ./hm_modules/helix/languages.toml;
  # waybar settings
  home.file.".config/waybar/config.jsonc".source = ./hm_modules/waybar/waybar.jsonc;
  # home.file."./.config/sway/config".source = ./hm_modules/sway/config;

  # Fonts
  home.file.".local/share/fonts/Fraktion.otf".source = ./fonts/fraktion.otf;

  # jrnl config file
  home.file.".config/jrnl/jrnl.yaml".source = ./hm_modules/jrnl.yaml;
  
  home = {
    /* The home.stateVersion option does not have a default and must be set */
    stateVersion = "18.09";
    /* Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ]; */
    packages = with pkgs; [

      # System Tools
      coreutils
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
      rx # pixel editor
      borgmatic
      syncthing

      # User Programs
      obsidian
      calibre
      mullvad-vpn
      openvpn
      spotify
      spotify-player
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
      p7zip
      discord
      krita
      gedit

      # Games
      steam
      openmw
      # portmod
      prismlauncher
      protonup-ng # tool to install proton-ge

      # Emulators
      mupen64plus

      # Browsers
      firefox
      chromium
      tor-browser
      # nyxt # emacs-like browser
        # still fails to build as of 8/06/2024

      # Messaging
      xwaylandvideobridge
      telegram-desktop
      element-desktop
      kdePackages.konversation # IRC client

      # Color Pickers
      # gpick
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
      cosmocc
      ruby
      lua
      rustc
      nim2
      python3
      go
      sbcl # Common Lisp
      racket # includes DrRacket
      nasm # Assembler

      # Dev Tools
      helix
      emacs
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
      # lldb #debugger
      delve # go debugger
      direnv
      jq
      ## LSP
      lua-language-server
      zls # Zig Language Server
      nil # Nix Language Server
      ruby-lsp # Ruby Language Server
      gopls # Go Language Server
      rust-analyzer # Rust Language Server
      uv # Python package manager
      pyright # Python Language Server
      ruff # Python Linter
      ruff-lsp

      # Web Dev
      nodejs_23

      # Windows Stuff
      wineWowPackages.stable
      winetricks

      # Network Tools
      httpie
      wireshark
      tcpdump
      socat
      netcat-openbsd
      wget
      curl
      dig # DNS client
      dogdns # DNS client
      inetutils

      # Hacker Tools
      nmap
      rustscan # port scanner
      ffuf
      feroxbuster # recursive content discovery tool
      burpsuite
      hashcat
      # john # password cracker
      metasploit
      exploitdb # searchsploit
      sqlmap
      aircrack-ng
      # wifite2
      thc-hydra # network logon cracker
      # dsniff # Collection of programs including a TCP sniffer
      ssh-audit # check for SSH vulns
      nikto # web server scanner
      # brutespray # bruteforces services found in nmap data with default creds
      # asnmap # https://github.com/projectdiscovery/asnmap
      wordlists # `wordlists_path` shows path, `wordlists` lists... lists
      filezilla
      net-snmp
      smbmap
      # netexec # fork of crackmapexec
      samba4Full
      whatweb # website scanner
      python312Packages.impacket
      nfs-utils # tools for working with NFS shares

      # Reverse Engineering Tools
      binsider
      cutter
      imhex # hex editor
      pwndbg
    
    ];

    sessionVariables = {
      EDITOR = "hx";
      TERMINAL = "alacritty";
      PAGER = "most";
    };

  };

}
