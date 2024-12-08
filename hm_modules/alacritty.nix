{ config, ... }:

let
  theme = import ./kanagawa.nix;
in {
  programs.alacritty = {
    enable = true;
    settings = {

      font = {
        normal = {
          # family = "Refraktury";
          family = "Iosevka Nerd Font";
          style = "Regular";
        };
        size = 14;
        offset = {
          x = 1;
          y = 1;
        };
      };

      window = {
        padding = {
          x = 25;
          y = 25;
        };
        dynamic_padding = true;
        decorations = "None";
        opacity = 0.95;
        #decorations = "Full";
      };

      cursor = {
        style = {
          shape = "Block";
          blinking = "On";
        };
      };

      colors = {
        primary = {
          background = theme.bg;
          foreground = theme.fg;
        };
        
        # cursor = {
        #   text = "";
        #   cursor = 05;
        # };
        
        normal = {
          black = theme.black;
          red = theme.red;
          green = theme.green;
          yellow = theme.yellow;
          blue = theme.blue;
          magenta = theme.magenta;
          cyan = theme.cyan;
          white = theme.white;
          # black = "0xdcd7ba";
          # red = "0xc34043";
          # green = "0x76946a";
          # yellow = "0xc0a36e";
          # blue = "0x7e9cd8";
          # magenta = "0x957fb8";
          # cyan = "0x6a9589";
          # white = "0x6a9589";
        };

        # bright = {
        #   black = "0x727169";
        #   red = "0xe82424";
        #   green = "0x98bb6c";
        #   yellow = "0xe6c384";
        #   blue = "0x7fb4ca";
        #   magenta = "0x938aa9";
        #   cyan = "0x7aa89f";
        #   white = "0xdcd7ba";
        # };
      };

      
      # keyboard = {
        
      #     {key = "F11", action = "ToggleFullscreen"}
      #     # {key = "c", mods = "Control", action = "Copy"},
      #     # {key = "v", mods = "Control", action = "Paste"}
        
      # };
    };
  };
}
