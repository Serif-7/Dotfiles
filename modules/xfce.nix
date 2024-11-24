{ config, pkgs, ... }: {

  services.xserver = {
    desktopManager.xfce.enable = true;
    desktopManager.xfce.enableScreensaver = true;

    displayManager.gdm.enable = true;
    
  };
  environment.systemPackages = with pkgs; [
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    
  ];

  programs.thunar.enable = true;
  programs.xfconf.enable = true;
}
