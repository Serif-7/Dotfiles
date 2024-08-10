{ config, lib, pkgs, ... }:

# This module handles a full sway setup, including:
# suspend/idle management [ ] # bug with sleep on wakeup
# notifications [x]
# bar [ ]
# clipboard manager [ ]
# fonts [ ]
# and core sway config




let
  swayfont = "Iosevka Bold 9";
  terminal = "${pkgs.alacritty}/bin/alacritty";
  wallpaper = "~/Dotfiles/wallpapers/cloud1.jpg";
  bemenu = "BEMENU_BACKEND=wayland ${pkgs.bemenu}/bin/bemenu-run -H 16 -p execute: -b --fn 'Terminus 9' --tf '#FFFFFF' --scf '#FFFFFF' --ff '#FFFFFF' --tb ''#FFFFFF --nf '#FFFFFF' --hf '#FFFFFF' --nb '#000000' --tb '#000000' --fb '#000000'";
  bemenu-run = "BEMENU_BACKEND=wayland ${pkgs.bemenu}/bin/bemenu-run --list \"10 down\"";
  launcher = bemenu-run;
  swaylockcmd = "${pkgs.swaylock}/bin/swaylock -i '${wallpaper}'";

in
  {
    wayland.windowManager.sway = {
    enable = true;
    config = rec {
      inherit terminal;
      modifier = "Mod4";
      defaultWorkspace = "workspace number 1";
      startup = [
        {command = "swaybg -i ${wallpaper}";}
        # {command = "firefox";}
        # {command = "workspace number 2";}
        # {command = "discord";}
        # {command = "workspace number 3";}
        # {command = "${terminal}";}
        # {command = "workspace number 1";}
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
          "${modifier}+Return" = "exec ${terminal}";
          "${modifier}+Shift+q" = "kill";
          # "${modifier}+d" = "exec ${pkgs.dmenu}/bin/dmenu_path | ${pkgs.dmenu}/bin/dmenu | ${pkgs.findutils}/bin/xargs swaymsg exec --";
          "${modifier}+d" = "exec ${launcher}";

          # Screenshot
          # "Print" = "exec ${pkgs.flameshot}/bin/flameshot gui";
          # "Print" = "exec ${pkgs.grim}/bin/grim -g \"${pkgs.slurp}/bin/slurp -d\" - | ${pkgs.wl-clipboard}/bin/wl-copy";
          # "${modifier}+p" = "exec ${pkgs.grim}/bin/grim -g '${pkgs.slurp}/bin/slurp -d' - > ~/Pictures/Screenshots";
          # "${modifier}+p" = "exec ${pkgs.grim}/bin/grim -q 100 ~/Pictures/Screenshots/$(date)";
          # "${modifier}+p" = "exec ${pkgs.grim}/bin/grim -q 100 ~/Pictures/Screenshots/$(${pkgs.coreutils}/bin/date)";
          # "${modifier}+p" = "exec echo 'SCREENSHOT'";

          # Saves image and copies to clipboard
          "Print" = "exec IMG=~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%s).png && grim $IMG && wl-copy -t image/png < $IMG";

          # lower/raise brightness
          "XF86MonBrightnessDown" = "exec brightnessctl set 10%-";
          "XF86MonBrightnessUp" = "exec brightnessctl set +10%";

          # audio controls
          "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_SINK@ toggle";
          "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_SINK@ 5%-";
          "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_SINK@ 5%+";
          
          };

      window.commands = [
        { criteria = { app_id = "dropdown"; }; command = "floating enable"; }
        { criteria = { app_id = "dropdown"; }; command = "resize set 1000 640"; }
        { criteria = { app_id = "dropdown"; }; command = "move scratchpad"; }
        { criteria = { app_id = "dropdown"; }; command = "border pixel 1"; }
      ];
    };
  };

  programs.waybar = {
    enable = true;
    systemd = {
      # enable systemd integration
      enable = true;
      target = "sway-session.target";
    };

    # CSS
    # needs to have fonts installed for this to work
    style = 
    ''
      * {
        border: none;
        border-radius: 0;
        font-family: FiraCode;
      }
      window#waybar {
        background: #16191C;
        color: #AAB2BF;
      }
      #workspaces button {
        padding: 0 5px;
      }
    '';
  
  };

  programs.bemenu = {
    enable = true;
  };

  services = {

    # idle daemon
    swayidle = {
      enable = true;

      events = [
        { event = "before-sleep"; command = "${swaylockcmd}";}
        { event = "lock"; command = "${swaylockcmd}";}
      ];

      timeouts = [
        # 5 minutes to lock, 10 minutes to suspend
        { timeout = 500; command = "${swaylockcmd}"; }
        { timeout = 1000; command = "${pkgs.systemd}/bin/systemctl suspend"; }
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

