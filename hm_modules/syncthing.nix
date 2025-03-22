{ config, ...}:

{
  services.syncthing = {
    enable = true;
    tray.enable = true;
    guiAddress = "127.0.0.1:8384";
    settings = {
      devices = {
        chaucer = {
          id = "DOZGJYB-RTA57EL-532SCAU-5ZPAKRA-JX52VKH-FJJVXUJ-DP5HB7M-MH5CSQX";
        };
        yeats = {
          id = "HASEHV5-FHR2L6O-S6YBOAN-IAYLQYX-AEL5B54-7GISMMP-7WUVGPJ-WAJCOAL";
        };
        melville = {
          id = "R2L6NI3-MWEJZQY-TWEX2NC-IA2IY27-4IJVUGP-M6YOERD-5YFJUAN-KMCLMAT";
          };
      };
      # NOTE: Folders still need to be accepted on both devices manually
      # to access melville's GUI: ssh -L 9999:localhost:8384 daniel@melville
      # then localhost:9999 in browser

      folders = {
        "/home/daniel/Documents" = {
          id = "Documents";
          
          devices = ["chaucer" "melville" "yeats"]; # without this, the folder will exist on all devices but not be shared
          # trashed files stored in .stverions
          versioning = {
            type = "trashcan";
            params.cleanoutDays = "1000";
          };
        };
        "/home/daniel/Pictures" = {
          id = "Pictures";
          
          devices = ["chaucer" "melville" "yeats"]; # without this, the folder will exist on all devices but not be shared
          # trashed files stored in .stverions
          versioning = {
            type = "trashcan";
            params.cleanoutDays = "1000";
          };
        };
        "/home/daniel/Videos" = {
          id = "Videos";
          
          devices = ["chaucer" "melville" "yeats"]; # without this, the folder will exist on all devices but not be shared
          # trashed files stored in .stverions
          versioning = {
            type = "trashcan";
            params.cleanoutDays = "1000";
          };
        };
        "/home/daniel/src" = {
          id = "src";
          
          devices = ["chaucer" "melville" "yeats"]; # without this, the folder will exist on all devices but not be shared
          # trashed files stored in .stverions
          versioning = {
            type = "trashcan";
            params.cleanoutDays = "1000";
          };
        };
        "/home/daniel/Calibre_Library" = {
          id = "Calibre Library"; 
          
          devices = ["chaucer" "melville" "yeats"]; # without this, the folder will exist on all devices but not be shared
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
