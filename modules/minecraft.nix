{ config, pkgs, ... }:

# this module handles a complete minecraft server setup, including
# a mod manager

{
  environment.systemPackages = with pkgs; [
    ferium # mod manager
    mcrcon # remote management tool
    # zulu # certified build of openjdk
    graalvm-ce # Optimized Java
    tmux # necessary to detach server
  ];

  services.minecraft-server = {
    enable = false;
    eula = true;
    package = pkgs.minecraft-server.override { version = "1.20.1"; };
    openFirewall = true;
    declarative = true;
    whitelist = {
      # https://mcuuid.net/ # get UUID for username here
      Serif7 = "cb05c650-737e-4973-8032-2fed7579d620";
    };
    serverProperties = {
      motd = "Welcome to Melville!";
      gamemode = "survival";
      pvp = true;
      difficulty = "hard";
      server-port = 25565;
      allow-flight = true;
      # enforce-secure-profile = false;
      level-name = "Melville";
      # not quite sure what this is
      # disabling it to be safe
      snooper-enabled = false;
      white-list = true;
      enable-rcon = true;
      "rcon.password" = "minecraft-melville";
    };
  };
}