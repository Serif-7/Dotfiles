{ config, pkgs, ... }:

# This module handles a full sway setup, including:
# suspend/idle management
# notifications
# bar
# clipboard
# and core sway config


{

  # home.file."./.config/sway/config".source = ./configs/sway/config;

  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "alacritty";
      defaultWorkspace = "workspace number 1";
      startup = [
        {command = "swaybg -i ./wallpapers/cloud1.jpg";}
        {command = "firefox";}
        {command = "alacritty";}
      ];

      # set to empty to disable swaybar
      bars = [];

      # menu = "wofi";

      gaps = {
        top = 5;
        bottom = 5;
        horizontal = 5;
        vertical = 5;
        inner = 5;
        outer = 5;
        left = 5;
        right = 5;
      };

      keybindings = 
        let 
          modifier = config.wayland.windowManager.sway.config.modifier;
        in lib.mkOptionDefault {
          "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
          "${modifier}+Shift+q" = "kill";
          # "${modifier}+d" = "exec ${pkgs.dmenu}/bin/dmenu_path | ${pkgs.dmenu}/bin/dmenu | ${pkgs.findutils}/bin/xargs swaymsg exec --";
          "${modifier}+d" = "exec ${pkgs.dmenu}/bin/dmenu_path | ${pkgs.dmenu}/bin/dmenu | ${pkgs.findutils}/bin/xargs swaymsg exec --";
          };
    
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
        # 5 minutes to lock, 10 minutes to suspend
        { timeout = 300; command = "${pkgs.swaylock}/bin/swaylock -F -i ./wallpapers/cloud1.jpg"; }
        { timeout = 600; command = "${pkgs.systemd}/bin/systemctl suspend"; }
      ];
    };

    # Notification daemon

    # mako = {
    #   enable = true;
    #   defaultTimeout = 2000;
    # };
    swaync = {
      enable = true;
    };
  };

  


}

