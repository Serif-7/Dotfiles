{config, pkgs, ...}:

{
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        savePath = "~/Pictures/Screenshots";
      };
    };
  };
}
