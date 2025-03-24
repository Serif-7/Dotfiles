{ config, pkgs, ... }:

{
  # Enable rtorrent service
  services.rtorrent = {
    enable = true;
    # dataDir = "/var/lib/rtorrent"; # Change this path as needed
    downloadDir = "/home/daniel/downloads"; # Change this path as needed
    openFirewall = true; # Open required ports in firewall
    # port = 50000; # BitTorrent port, feel free to change
    # configText = ''
    # '';
  };

  # Set up ruTorrent web interface 
  # services.nginx = {
  #   enable = true;
  #   virtualHosts."seedbox.local" = {  # Change to your domain or IP
  #     root = "${pkgs.rutorrent}/share/rutorrent";
  #     locations."/RPC2" = {
  #       proxyPass = "http://localhost:5000";  # SCGI port for rtorrent
  #     };
  #   };
  # };
  
  # Open web interface port
  # networking.firewall.allowedTCPPorts = [ 80 443 ];
  
  # For external access, consider setting up HTTPS with Let's Encrypt
  # security.acme.acceptTerms = true;
  # security.acme.email = "your-email@example.com";
}
