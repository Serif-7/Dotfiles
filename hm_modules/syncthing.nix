{ config, ...}:

{
  services.syncthing = {
    enable = true;
    guiAddress = "127.0.0.1:8384";
    settings = {
      devices = {
        chaucer = {
          id = "DOZGJYB-RTA57EL-532SCAU-5ZPAKRA-JX52VKH-FJJVXUJ-DP5HB7M-MH5CSQX";
        };
        # "yeats" = {};
        melville = {
          id = "R2L6NI3-MWEJZQY-TWEX2NC-IA2IY27-4IJVUGP-M6YOERD-5YFJUAN-KMCLMAT";
          };
      };
      folders = {
        "/home/daniel/Documents" = {
          id = "Documents";
          # devices = ["chaucer"];
          # trashed files stored in .stverions
          versioning = {
            type = "trashcan";
            params.cleanoutDays = "1000";
            };
          };
        };
      };
    };
}
