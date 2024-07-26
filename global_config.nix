{ config, pkgs, ... }: {

  # System level configuration for all hosts

  nix.extraOptions = ''
    extra-experimental-features = nix-command flakes
    '';

  #set default shell to fish
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  users.users.daniel.shell = pkgs.fish;

    # added 5/28/2024 because one of the installed
  # packages' electron versio was declared EOL
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
    ];

  # block timewasting sites
  networking.hosts = {
    "127.0.0.1" = ["www.twitter.com" "twitter.com" "www.x.com" "x.com" "www.youtube.com" "youtube.com" "www.reddit.com" "www.news.ycombinator" "news.ycombinator.com"];
    
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


}
