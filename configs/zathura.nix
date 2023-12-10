{ config, ... }:


let
  colors = import ./kanagawa.nix;
in {
  programs.zathura = {
    enable = true;


    mappings = {
      "<Right>" = "navigate next";
      "<Left>" = "navigate previous";
    };
    
    options = {
      default-bg = colors.kanagawa.bg;
      default-fg = colors.kanagawa.fg;
      statusbar-fg = colors.kanagawa.fg;
      statusbar-bg = colors.kanagawa.bg;
      inputbar-bg = colors.kanagawa.bg;
      inputbar-fg = colors.kanagawa.fg;
      notification-bg = colors.kanagawa.red;
      notification-fg = colors.kanagawa.red;
      notification-error-bg = colors.kanagawa.red;
      notification-error-fg = colors.kanagawa.red;
      notification-warning-bg = colors.kanagawa.red;
      notification-warning-fg = colors.kanagawa.red;
      highlight-color = colors.kanagawa.blue;
      highlight-active-color = colors.kanagawa.white;
      completion-bg = colors.kanagawa.bg;  
      completion-fg = colors.kanagawa.fg;
      completion-highlight-fg = colors.kanagawa.white;
      completion-highlight-bg =  colors.kanagawa.bg;
      recolor-lightcolor = colors.kanagawa.bg;
      recolor-darkcolor = colors.kanagawa.white;
    };
  };
}
