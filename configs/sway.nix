{ config, pkgs, ... }:

# This module handles a full sway setup, including:
# suspend/idle management
# notifications
# bar
# clipboard
# and core sway config


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

  programs.waybar = {
    enable = true;
    systemd = {
      # enable systemd integration
      enable = true;
      target = "sway-session.target";
    };
    
  };

  services = {

    # idle daemon
    swayidle = {
      enable = true;
      timeouts = [
        { timeout = 300; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
        { timeout = 500; command = "${pkgs.systemd}/bin/systemctl suspend"; }
      ];
    };

    # Notification daemon
    mako = {
      enable = true;
      defaultTimeout = 5;
    };
  };


}

