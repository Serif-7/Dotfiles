{ config, lib, pkgs, ... }:

# This module handles a full sway setup, including:
# suspend/idle management [ ] # bug with sleep on wakeup
# notifications [x]
# bar [ ]
# clipboard manager [ ]
# fonts [ ]
# and core sway config




let
  swayfont = "Iosevka Nerd Font";
  terminal = "${pkgs.alacritty}/bin/alacritty";
  browser = "${pkgs.firefox}/bin/firefox";
  pdf_reader = "${pkgs.zathura}/bin/zathura";
  music_player = "${pkgs.spotify}/bin/spotify";
  calculator = "";
  notepad = "";
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
        {command = "${browser}";}

        
        # {command = "workspace number 2";}
        # {command = "discord";}
        # {command = "workspace number 3";}
        # {command = "${terminal}";}
        # {command = "workspace number 1";}
      ];
      assigns = {
        "1: web" = [{ app_id = "(?i).*firefox.*"; }];
        "2: discord" = [{ class = "(?i).*discord.*";}];
        "3: notes" = [{ class = "(?i).*obsidian.*";}];
        "11: torrents" = [{ class = "(?i).*qbittorrent.*";}];
        # "4: book" = [{ app_id = "(?i).*zathura.*";}];
        # "3: terminal" = [{ class = "^alacritty$";}];
        # "4: matrix" = [{ app_id = "element";}];
      };

      

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
          "${modifier}+q" = "kill";
          # "${modifier}+d" = "exec ${pkgs.dmenu}/bin/dmenu_path | ${pkgs.dmenu}/bin/dmenu | ${pkgs.findutils}/bin/xargs swaymsg exec --";
          "${modifier}+d" = "exec ${launcher}";
          "${modifier}+z" = "exec ${pdf_reader}";
          "${modifier}+m" = "exec ${music_player}";
          # "${modifier}+c" = "";
          # floating notepad for quick notes
          # "${modifier}+n" = "";
          
          # journal entry
          # open floating window with helix
          # "${modifier}+j" = "exec ~/Dotfiles/scripts/jrnl.fish";
          
           # move window to scratchpad
          "${modifier}+minus" = "move scratchpad";
          # cycle through scratchpad windows
          "${modifier}+equal" = "scratchpad show";

          # split window horizontal
          "${modifier}+h" = "splith";
          # split window vertical
          "${modifier}+v" = "splitv";

          # toggle between floating/tiling
          # can be used to remove windows from scratchpad
          # (scratchpad windows are normal floating windows)
          "${modifier}+space" = "floating toggle";



          # Screenshot
          # "Print" = "exec ${pkgs.flameshot}/bin/flameshot gui";
          # "Print" = "exec ${pkgs.grim}/bin/grim -g \"${pkgs.slurp}/bin/slurp -d\" - | ${pkgs.wl-clipboard}/bin/wl-copy";
          # "${modifier}+p" = "exec ${pkgs.grim}/bin/grim -g '${pkgs.slurp}/bin/slurp -d' - > ~/Pictures/Screenshots";
          # "${modifier}+p" = "exec ${pkgs.grim}/bin/grim -q 100 ~/Pictures/Screenshots/$(date)";
          # "${modifier}+p" = "exec ${pkgs.grim}/bin/grim -q 100 ~/Pictures/Screenshots/$(${pkgs.coreutils}/bin/date)";
          # "${modifier}+p" = "exec echo 'SCREENSHOT'";

          # Saves image and copies to clipboard
          "Print" = "exec IMG=~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%s).png && grim -g \"$(slurp)\" $IMG && wl-copy -t image/png < $IMG";
          # "Print" = "exec flameshot gui --clipboard";

          # lower/raise brightness
          "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
          "XF86MonBrightnessUp" = "exec brightnessctl set +5%";

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

    # settings = import ./waybar.nix;

    # CSS
    # needs to have fonts installed for this to work
    style = ./waybar/waybar.css;
    # ''
    #   * {
    #     border: none;
    #     border-radius: 0;
    #     font-family: ${swayfont};
    #   }
    #   window#waybar {
    #     background: #16191C;
    #     color: #AAB2BF;
    #   }
    #   #workspaces button {
    #     padding: 0 5px;
    #   }
    # '';
  
  };

  programs.bemenu = {
    enable = true;
  };

  services = {

    # idle daemon
    swayidle = {
      enable = true;
      systemdTarget = "sway-session.target";

      events = [
        { event = "before-sleep"; command = "${swaylockcmd}";}
        { event = "lock"; command = "${swaylockcmd}";}
      ];

      timeouts = [
        # 5 minutes to lock, 10 minutes to suspend
        { timeout = 500; command = "${swaylockcmd}"; }
        # { timeout = 1000; command = "${pkgs.systemd}/bin/systemctl suspend"; }
      ];
    };

    # Notification daemon

    # mako = {
    #   enable = true;
    #   defaultTimeout = 2000;
    # };
    swaync = {
      enable = true;
      style = 
        ''
        * {
          border: none;
          border-radius: 0;
          font-family: ${swayfont};
        }
        '';
    };
  };
}

