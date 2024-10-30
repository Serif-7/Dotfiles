# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


  virtualisation.docker.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-e0de7d5f-e93b-426f-8021-3690e8e6e56a".device = "/dev/disk/by-uuid/e0de7d5f-e93b-426f-8021-3690e8e6e56a";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking = {
    hostName = "Yeats";
    networkmanager.enable = true;
    wireless = {
      userControlled.enable = true;
    };
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.daniel = {
  #   isNormalUser = true;
  #   description = "Daniel";
  #   extraGroups = [ "networkmanager" "wheel" "docker"];
  #   packages = with pkgs; [
  #     firefox
  #   #  thunderbird
  #   ];
  # };

  programs.gamemode.enable = true;
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    neovim
    helix
    fish
    git
    tlp

  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.a:wgent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  services.power-profiles-daemon.enable = false;
  services.tlp.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  services.openssh = {
    banner = "
                                                                                            
                                                                                            
YYYYYYY       YYYYYYY                                        tttt                           
Y:::::Y       Y:::::Y                                     ttt:::t                           
Y:::::Y       Y:::::Y                                     t:::::t                           
Y::::::Y     Y::::::Y                                     t:::::t                           
YYY:::::Y   Y:::::YYYeeeeeeeeeeee    aaaaaaaaaaaaa  ttttttt:::::ttttttt        ssssssssss   
   Y:::::Y Y:::::Y ee::::::::::::ee  a::::::::::::a t:::::::::::::::::t      ss::::::::::s  
    Y:::::Y:::::Y e::::::eeeee:::::eeaaaaaaaaa:::::at:::::::::::::::::t    ss:::::::::::::s 
     Y:::::::::Y e::::::e     e:::::e         a::::atttttt:::::::tttttt    s::::::ssss:::::s
      Y:::::::Y  e:::::::eeeee::::::e  aaaaaaa:::::a      t:::::t           s:::::s  ssssss 
       Y:::::Y   e:::::::::::::::::e aa::::::::::::a      t:::::t             s::::::s      
       Y:::::Y   e::::::eeeeeeeeeee a::::aaaa::::::a      t:::::t                s::::::s   
       Y:::::Y   e:::::::e         a::::a    a:::::a      t:::::t    ttttttssssss   s:::::s 
       Y:::::Y   e::::::::e        a::::a    a:::::a      t::::::tttt:::::ts:::::ssss::::::s
    YYYY:::::YYYY e::::::::eeeeeeeea:::::aaaa::::::a      tt::::::::::::::ts::::::::::::::s 
    Y:::::::::::Y  ee:::::::::::::e a::::::::::aa:::a       tt:::::::::::tt s:::::::::::ss  
    YYYYYYYYYYYYY    eeeeeeeeeeeeee  aaaaaaaaaa  aaaa         ttttttttttt    sssssssssss    
                                                                                            
                                                                                            
                                                                                            
                                                                                            ";
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # block timewasting sites
  networking.hosts = {
    "0.0.0.0" = [
      # "www.twitter.com" "twitter.com" "www.x.com" "x.com"
      # "www.news.ycombinator" "news.ycombinator.com"
      # "www.youtube.com" "youtube.com"
      # "www.4channel.org" "www.4chan.org"
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
