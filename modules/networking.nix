{ config, pkgs, ... }: {

  networking = {
  
    hosts = {

      #block timewasting sites
      "0.0.0.0" = [
      "www.twitter.com" "twitter.com" "www.x.com" "x.com" 
      #"www.youtube.com" "youtube.com" 
      # "www.reddit.com" 
      #"www.news.ycombinator" "news.ycombinator.com"
      "www.4channel.org" "www.4chan.org"
      ];

      # address for hosts when at home
      "192.168.0.93" = ["chaucer"];
      "192.168.0.163" = ["yeats"];
      "192.168.0.61" = ["melville"];

      # HTB
      # "10.10.11.32" = ["sightless.htb" "sqlpad.sightless.htb"];
      "10.10.11.53" = ["cat.htb"];
      "10.10.11.28" = ["sea.htb"];
    };

    firewall = {
      allowedTCPPorts = [
        21
        22
        1337
        4444 # default meterpreter port
        8080
      ];
    };
  };
}
