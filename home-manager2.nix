{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  
    vim
    ponysay
    
  ];

  programs.vim = {
    enable = true;
    extraConfig = ''
      " Your custom Vim configurations "
    '';
  };

  # Other Home Manager configurations
}
