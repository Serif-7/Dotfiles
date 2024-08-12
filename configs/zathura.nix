{ config, ... }:


let
  theme= import ./kanagawa.nix;
in {
  programs.zathura = {
    enable = true;


    mappings = {
      "<Right>" = "navigate next";
      "<Left>" = "navigate previous";
    };
    
    options = {
      default-bg = theme.bg;
      default-fg = theme.fg;
      statusbar-fg = theme.fg;
      statusbar-bg = theme.bg;
      inputbar-bg = theme.bg;
      inputbar-fg = theme.fg;
      notification-bg = theme.red;
      notification-fg = theme.red;
      notification-error-bg = theme.red;
      notification-error-fg = theme.red;
      notification-warning-bg = theme.red;
      notification-warning-fg = theme.red;
      highlight-color = theme.blue;
      highlight-active-color = theme.white;
      completion-bg = theme.bg;  
      completion-fg = theme.fg;
      completion-highlight-fg = theme.white;
      completion-highlight-bg =  theme.bg;
      recolor-lightcolor = theme.bg;
      recolor-darkcolor = theme.white;

      
      recolor = true;
      toggle_fullscreen = true;
    };
  };
}
