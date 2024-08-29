{
  services.minecraft-server = {
    enable = true;
    eula = true;
    declarative = true;
    whitelist = {
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
    };
  };
}
