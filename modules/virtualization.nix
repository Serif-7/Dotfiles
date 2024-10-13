{ config, pkgs, ... }:

# this module handles a complete minecraft server setup, including
# a mod manager

{
  environment.systemPackages = with pkgs; [
    qemu
    virt-manager
    libvirt
    virtualbox
  
  ];

  # virtualisation.libvirtd.enable = true;
  # programs.virt-manager.enable = true;

  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.guest.enable = true;

}
