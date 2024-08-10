{ config, pkgs, ... }: {

  # System level configuration for all hosts

  # nix.extraOptions = ''
  #   extra-experimental-features = nix-command flakes
  #   '';
  programs.wshowkeys.enable = true;

  networking.supplicant = {
    "wlp2s0" = {
      # extraConf = ''
      #   network={
      #   ssid="DefCon"
      #   priority=1
      #   proto=RSN
      #   key_mgmt=WPA-EAP
      #   pairwise=CCMP
      #   auth_alg=OPEN
      #   eap=PEAP
      #   identity="serif"
      #   password="b8jmUMkQS2sMi8"
      #   phase1="peaplabel=0"
      #   phase2="auth=MSCHAPV2"
      #   ca_path="/etc/ssl/certs/"
      #   altsubject_match="DNS:wifireg.defcon.org"
      #   }
      # '';
      configFile.path = "/home/daniel/defcon_wifi.conf";
    };
  };

  security.pki.certificates = [
    ''
    subject=CN=wifireg.defcon.org
issuer=CN=HARICA DV TLS ECC, O=Hellenic Academic and Research Institutions CA, C=GR
-----BEGIN CERTIFICATE-----
MIIEvjCCBEWgAwIBAgIQPSwck1nCR/ymp59ESa4SvzAKBggqhkjOPQQDAzBiMQswCQYDVQQGEwJH
UjE3MDUGA1UECgwuSGVsbGVuaWMgQWNhZGVtaWMgYW5kIFJlc2VhcmNoIEluc3RpdHV0aW9ucyBD
QTEaMBgGA1UEAwwRSEFSSUNBIERWIFRMUyBFQ0MwHhcNMjQwNzA5MjMzNTE4WhcNMjUwNzA5MjMz
NTE4WjAdMRswGQYDVQQDDBJ3aWZpcmVnLmRlZmNvbi5vcmcwdjAQBgcqhkjOPQIBBgUrgQQAIgNi
AATLtsZkZJ8cbO3mOmo4efeop3YS5XHcD2CSBGeBYUp9Z7IgRPRWUBYVpa/f7Hi5darBsypp691k
kyfFR03V2qD4Gn94hMOPOAlRv9ceagpjTgUZXpgs8pUMSLzrAPPeIcCjggMDMIIC/zAfBgNVHSME
GDAWgBTbgh8xTkeJ3gl8CpRjVBWIa5ZNkTBsBggrBgEFBQcBAQRgMF4wOQYIKwYBBQUHMAKGLWh0
dHA6Ly9jcnQuaGFyaWNhLmdyL0hBUklDQS1EVi1UTFMtU3ViLUUxLmNlcjAhBggrBgEFBQcwAYYV
aHR0cDovL29jc3AuaGFyaWNhLmdyMC4GA1UdEQQnMCWCEndpZmlyZWcuZGVmY29uLm9yZ4IPd2lm
aS5kZWZjb24ub3JnMC0GA1UdIAQmMCQwCAYGZ4EMAQIBMAgGBgQAj3oBBjAOBgwrBgEEAYHPEQEB
AQEwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMBMD4GA1UdHwQ3MDUwM6AxoC+GLWh0dHA6
Ly9jcmwuaGFyaWNhLmdyL0hBUklDQS1EVi1UTFMtU3ViLUUxLmNybDAdBgNVHQ4EFgQUoRPrtlnz
CjoXjBao9w5NZ2NQbU4wDgYDVR0PAQH/BAQDAgeAMIIBfwYKKwYBBAHWeQIEAgSCAW8EggFrAWkA
dwCvGBoo1oyj4KmKTJxnqwn4u7wiuq68sTijoZ3T+bYDDQAAAZCZ4yn5AAAEAwBIMEYCIQC2umch
GU2fvfKFco4EjWPIxbhfMjb8q3N/ZEcVSoH4EQIhAI+KJMOxG8NBXA7Pk943/dSA50//wS3qg47h
J0vr6Nw0AHUA5tIxY0B3jMEQQQbXcbnOwdJA9paEhvu6hzId/R43jlAAAAGQmeMqywAABAMARjBE
AiAl/osLiOMimcihRdCMaDmXMJMhNQUCM/ZxQMI4ehSCgwIgaFuB5EW4BwQZSb+aGmEZvmmbpUSi
cgIRWRsR4vaaNzkAdwDd3Mo0ldfhFgXnlTL6x5/4PRxQ39sAOhQSdgosrLvIKgAAAZCZ4ynsAAAE
AwBIMEYCIQDh1ul+9AOhOKyw4djG8f3qEnEWwmviGrwoZ7+Uf8Pp+AIhAId1579xMktqGOx3fN9n
qQxvaXN26X1Sjw6HO5R0Hkq4MAoGCCqGSM49BAMDA2cAMGQCMC1xPLHHuhUDwHKak2nplyIN8GsB
cxepv6w/YnWy3Y8LfYbnHGhQBkD+X+5lwDXVpQIwDTJ9e5l9RwPw0W/nUdqQJeSo97LSS0GnrQS9
Ed2TvoaIDcH5fleCxAWS7irD5Be4
-----END CERTIFICATE-----
subject=CN=HARICA DV TLS ECC, O=Hellenic Academic and Research Institutions CA, C=GR
issuer=CN=HARICA TLS ECC Root CA 2021, O=Hellenic Academic and Research Institutions CA, C=GR
-----BEGIN CERTIFICATE-----
MIIDczCCAvigAwIBAgIQYhFm53o2Wyr/+S7JIy1TaDAKBggqhkjOPQQDAzBsMQswCQYDVQQGEwJH
UjE3MDUGA1UECgwuSGVsbGVuaWMgQWNhZGVtaWMgYW5kIFJlc2VhcmNoIEluc3RpdHV0aW9ucyBD
QTEkMCIGA1UEAwwbSEFSSUNBIFRMUyBFQ0MgUm9vdCBDQSAyMDIxMB4XDTIxMDMxOTA5MjIzM1oX
DTM2MDMxNTA5MjIzMlowYjELMAkGA1UEBhMCR1IxNzA1BgNVBAoMLkhlbGxlbmljIEFjYWRlbWlj
IGFuZCBSZXNlYXJjaCBJbnN0aXR1dGlvbnMgQ0ExGjAYBgNVBAMMEUhBUklDQSBEViBUTFMgRUND
MHYwEAYHKoZIzj0CAQYFK4EEACIDYgAE6CvSreH/yHFTsmv44Rd2eOYXiYeMsNpO3VXxUpUqQyae
tnuFwsl4cwzury4KmGPQA3e4zmpJ8L2CH3xJk+K6THlRWhRNcozi5c2bO7HPgB50aaUugVkkQB1L
xK/S9L8do4IBZzCCAWMwEgYDVR0TAQH/BAgwBgEB/wIBADAfBgNVHSMEGDAWgBTJG1OBEv4E1RbR
qryab7eglRluyjBUBggrBgEFBQcBAQRIMEYwRAYIKwYBBQUHMAKGOGh0dHA6Ly9yZXBvLmhhcmlj
YS5nci9jZXJ0cy9IQVJJQ0EtVExTLVJvb3QtMjAyMS1FQ0MuY2VyMEQGA1UdIAQ9MDswOQYEVR0g
ADAxMC8GCCsGAQUFBwIBFiNodHRwOi8vcmVwby5oYXJpY2EuZ3IvZG9jdW1lbnRzL0NQUzAdBgNV
HSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwEwQgYDVR0fBDswOTA3oDWgM4YxaHR0cDovL2NybC5o
YXJpY2EuZ3IvSEFSSUNBLVRMUy1Sb290LTIwMjEtRUNDLmNybDAdBgNVHQ4EFgQU24IfMU5Hid4J
fAqUY1QViGuWTZEwDgYDVR0PAQH/BAQDAgGGMAoGCCqGSM49BAMDA2kAMGYCMQDcXjqcOyf4zkWB
jPxkWSUfeUGlHlOXhZaqxDaLpAq4pj2fEwx/W280rRXUs/a36zcCMQDJ7dvkYdtad4cTZW2fNatW
2G5Gk7/noRbGsp6wWwoAdOT3oVYa3hC4l4TYbtcVnTo=
-----END CERTIFICATE-----
subject=CN=HARICA TLS ECC Root CA 2021, O=Hellenic Academic and Research Institutions CA, C=GR
issuer=CN=Hellenic Academic and Research Institutions ECC RootCA 2015, O=Hellenic Academic and Research Institutions Cert. Authority, L=Athens, C=GR
-----BEGIN CERTIFICATE-----
MIIDezCCAwGgAwIBAgIQcWAnyIV6c1Qt71FsHC7rDzAKBggqhkjOPQQDAzCBqjELMAkGA1UEBhMC
R1IxDzANBgNVBAcTBkF0aGVuczFEMEIGA1UEChM7SGVsbGVuaWMgQWNhZGVtaWMgYW5kIFJlc2Vh
cmNoIEluc3RpdHV0aW9ucyBDZXJ0LiBBdXRob3JpdHkxRDBCBgNVBAMTO0hlbGxlbmljIEFjYWRl
bWljIGFuZCBSZXNlYXJjaCBJbnN0aXR1dGlvbnMgRUNDIFJvb3RDQSAyMDE1MB4XDTIxMDkwMjA3
NDQzN1oXDTI5MDgzMTA3NDQzNlowbDELMAkGA1UEBhMCR1IxNzA1BgNVBAoMLkhlbGxlbmljIEFj
YWRlbWljIGFuZCBSZXNlYXJjaCBJbnN0aXR1dGlvbnMgQ0ExJDAiBgNVBAMMG0hBUklDQSBUTFMg
RUNDIFJvb3QgQ0EgMjAyMTB2MBAGByqGSM49AgEGBSuBBAAiA2IABDgI/rGgltJ6rK9JOtDA4MM7
KKrxcm1lAEeIhPyaJmuqS7psBAqIXhfyVYf8MLA04jRYVxqEU+kw2anylnTDUR9YSTHMmE5gEYd1
03KUkE+bECUqqHgtvpBBWJAVcqeht6OCAScwggEjMA8GA1UdEwEB/wQFMAMBAf8wHwYDVR0jBBgw
FoAUtCILgpkkAQ6cu+QO/b/7lyCTmSowTwYIKwYBBQUHAQEEQzBBMD8GCCsGAQUFBzAChjNodHRw
Oi8vcmVwby5oYXJpY2EuZ3IvY2VydHMvSGFyaWNhRUNDUm9vdENBMjAxNS5jcnQwEQYDVR0gBAow
CDAGBgRVHSAAMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDATA9BgNVHR8ENjA0MDKgMKAu
hixodHRwOi8vY3JsLmhhcmljYS5nci9IYXJpY2FFQ0NSb290Q0EyMDE1LmNybDAdBgNVHQ4EFgQU
yRtTgRL+BNUW0aq8mm+3oJUZbsowDgYDVR0PAQH/BAQDAgGGMAoGCCqGSM49BAMDA2gAMGUCMQCP
c45gQV6pCkMR4px3k+YnF0MoDpXQ0+0lWz7fnplqgHn+qHmoKrE5Y/bcWucG6QQCMB/DIYjUTGAl
5j07G7ZIuK3Qehx68VPXTwvJ9tLbh9A9SkiBmJGpiHL7Rzfxa5CptQ==
-----END CERTIFICATE-----
    ''
  ];
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
  

  ### Window Manager / Desktop Environment
  
  security.polkit.enable = true; # controls privileges for processes
  # necessary to enable to make sway work in home-manager

  # necessary for swaylock to work
  # without this option it will not accept the user password
  # as it will have no access to it
  security.pam.services.swaylock = {};

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
  services.greetd = {                                                      
    enable = true;                                                         
    settings = {                                                           
      default_session = {                                                  
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "greeter";                                                  
      };
      #auto login
      initial_session = {
        command = "${pkgs.sway}";
        user = "daniel";
      };                                                                   
    };                                                                     
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
      AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
  };

  # enable mullvad VPN
  services.mullvad-vpn.enable = true;

  # Fonts
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
      ubuntu_font_family
      liberation_ttf
      # Persian Font
      vazir-fonts
    ];

    fontconfig = {
      defaultFonts = {
        serif = [  "Liberation Serif" ];
        sansSerif = [ "FiraCode" ];
        monospace = [ "FiraCode" ];
      };
    };
  };

}
