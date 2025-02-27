{ config, pkgs, ... }: {

  # System level configuration for all hosts

  # nix.extraOptions = ''
  #   extra-experimental-features = nix-command flakes
  #   '';

  # enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.daniel = {
    isNormalUser = true;
    description = "Serif";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      fish
    #  thunderbird
    ];
  };
  

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  #set default shell to fish
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  users.users.daniel.shell = pkgs.fish;

  # added 5/28/2024 because one of the installed
  # packages' electron versio was declared EOL
  # nixpkgs.config.permittedInsecurePackages = [
  #   "electron-25.9.0"
  #   ];

  networking.hosts = {

    #block timewasting sites
    "0.0.0.0" = [
    "www.twitter.com" "twitter.com" "www.x.com" "x.com" 
    #"www.youtube.com" "youtube.com" 
    #"www.reddit.com" 
    #"www.news.ycombinator" "news.ycombinator.com"
    "www.4channel.org" "www.4chan.org"
    ];

    # address for hosts when at home

    "192.168.0.93" = ["chaucer"];
    "192.168.0.163" = ["yeats"];
  };

  # SSH config
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = [ "daniel" "serif"]; # Allows all users by default. Can be [ "user1" "user2" ]
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
  };


  # Fonts
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.iosevka
      ubuntu_font_family
      liberation_ttf
    ];

    fontconfig = {
      defaultFonts = {
        serif = [  "Liberation Serif" ];
        sansSerif = [ "Iosevka" ];
        monospace = [ "Iosevka" ];
      };
    };
  };

  # scripts run on every rebuild
  system.activationScripts = {
    
  };

  # enable mullvad VPN
  services.mullvad-vpn.enable = true;

  programs.wshowkeys.enable = true;

  # virtual filesystem
  services.gvfs.enable = true;
  # storage device manipulation
  services.udisks2.enable = true;

  # keyboard remapping
  # services.kanata = {
  #   enable = true;
  #   keyboards = {
  #     # remap capslock to super key
  #     "default".config = ''
  #     (defsrc)
  #     (deflayermap (base-layer)
  #       caps lmet
  #       )
  #     '';
  #   };
  # };
}
