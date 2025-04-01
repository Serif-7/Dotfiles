{ config, pkgs, ... }:

# Matrix server setup

{
  environment.systemPackages = with pkgs; [
    matrix-conduit
  ];

  services.matrix-conduit = {
    enable = true;
    settings = {
      global = {
        port = 6167;
        server_name = "Melville";
        allow_registration = true;
      };
      # allow_room_creation = true;
      
    };
  };

}
