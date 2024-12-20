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
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "vboxusers"];
    packages = with pkgs; [
      firefox
      fish
    #  thunderbird
    ];
  };
  

  ### Window Manager / Desktop Environment
  
  # programs.sway.enable = true;
  # security.polkit.enable = true; # controls privileges for processes
  # necessary to enable to make sway work in home-manager

  # necessary for swaylock to work
  # without this option it will not accept the user password
  # as it will have no access to it
  # security.pam.services.swaylock = {};

  # enable desktop portal for wlroots compositors
  # xdg.portal.wlr.enable = true;
  # xdg.portal.config.common.default = "*";

  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # services.displayManager.sddm = {
  #   enable = true;
  #   wayland = {
  #     enable = true;
  #   };
  #   settings = {
  #     Autologin = {
  #       User = "daniel";
  #     };
      
  #   };
  # };

  # Greeter for launching Sway
  # services.greetd = {                                                      
  #   enable = true;                                                         
  #   settings = {                                                           
  #     default_session = {                                                  
  #       command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
  #       user = "greeter";                                                  
  #     };
  #     #auto login
  #     initial_session = {
  #       command = "${pkgs.sway}";
  #       user = "daniel";
  #     };                                                                   
  #   };                                                                     
  # };
  
  

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
