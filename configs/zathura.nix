{ config, ... }:


let
  colors = import ./kanagawa.nix;
in {
  programs.zathura = {
    enable = true;
    options = {
      default-bg = colors.kanagawa.bg;
      default-fg = colors.kanagawa.fg;
      statusbar-fg = colors.kanagawa.fg;
      statusbar-bg = colors.kanagawa.bg;
      inputbar-bg = colors.kanagawa.red;
      inputbar-fg = colors.kanagawa.red;
      notification-bg = colors.kanagawa.red;
      notification-fg = colors.kanagawa.red;
      notification-error-bg = colors.kanagawa.red;
      notification-error-fg = colors.kanagawa.red;
      notification-warning-bg = colors.kanagawa.red;
      notification-warning-fg = colors.kanagawa.red;
      highlight-color = colors.kanagawa.red;
      highlight-active-color = colors.kanagawa.red;
      completion-bg = colors.kanagawa.red;  
      completion-fg = colors.kanagawa.red;
      completion-highlight-fg = colors.kanagawa.red;
      completion-highlight-bg =  colors.kanagawa.red;
      recolor-lightcolor = colors.kanagawa.red;
      recolor-darkcolor = colors.kanagawa.red;
    };
  };
}
