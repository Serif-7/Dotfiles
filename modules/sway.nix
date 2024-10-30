{ config, pkgs, ... }: {
  programs.sway.enable = true;
  security.polkit.enable = true; # controls privileges for processes
  # necessary to enable to make sway work in home-manager

  # necessary for swaylock to work
  # without this option it will not accept the user password
  # as it will have no access to it
  security.pam.services.swaylock = {};
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

}
