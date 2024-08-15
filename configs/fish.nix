
{ config, ...}:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      bind -k nul -M insert 'accept-autosuggestion'
    '';

    functions = {
      # move stuff to trash instead of deleting by default
      trash = ''
        set trash_dir "$HOME/.trash"
    
        if not test -d $trash_dir
          mkdir -p $trash_dir
        end
    
        mv $argv $trash_dir
      '';

      # download the audio from a youtube video as an mp3
      download_yt_audio = ''
        yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 $argv[1] -o "$argv[2].%(ext)s"
      '';
    };

    shellAliases = {
      ls = "eza";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      grep = "rg";
      ping = "gping";
      ps = "procs";
      find = "fd";
      cat = "bat -p";
      # git = "gl";

      # default scan
      scan = "nmap -sC -sV -oA";
    };
    shellAbbrs = {
      c = "cd";
      g = "gl";
      stats = "btm";
    };
  };
}
