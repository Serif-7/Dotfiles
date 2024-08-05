{ config, pkgs, ... }:


{
  wayland.windowManager.sway = {
  enable = true;
  config = rec {
    modifier = "Mod4";
    terminal = "alacritty";
    defaultWorkspace = "workspace number 1";
    # startup = [
    #   {command = "alacritty"; always = true;}
    # ];
    
    };
  };

  services.swayidle = {
    enable = true;
    timeouts = [
      { timeout = 300; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
      { timeout = 500; command = "${pkgs.systemd}/bin/systemctl suspend"; }
    ];
  };

}

