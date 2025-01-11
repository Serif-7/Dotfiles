
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

      # send all items in folder to specified computer on server
      send_to_server = ''
        scp * "daniel@Melville:~/Melville/computercraft/computer/$argv[1]"
      '';

      # Reverse shell listener
      listener = ''
        echo "Listening on port $argv[1]";
        socat - TCP-LISTEN:$argv[1],fork
      '';

      scan = ''
        nmap -sC -sV $argv
      '';

      # dirbust <domain>
      dirbust = ''
        feroxbuster -u $argv[1] -w (wordlists_path)/seclists/Discovery/Web-Content/common.txt $argv[2..-1]
      '';

      cdtemp = ''
        cd $(mktemp -d)
      '';

      testfunc = ''
      for word in $(cat $(wordlists_path)/seclists/Discovery/DNS/subdomains-top1million-110000.txt);
        echo $word;
      end
      '';

      # enum_subdomains <domain> <IP>
      enum_subdomains = ''
        for sub in $(cat $(wordlists_path)/seclists/Discovery/DNS/subdomains-top1million-110000.txt);
          dig $argv[1].inlanefreight.htb @$argv[2] | grep -v ';\|SOA' | sed -r '/^\s*$/d' | grep $sub | tee -a subdomains.txt;
        end
      '';

    };

    shellAliases = {
      ls = "eza";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      search = "rg";
      # ping = "gping";
      # ps = "procs";
      # find = "fd";
      cat = "bat -p";
      cdtemp = "cd $(mktemp -d)";
      # git = "gl";
    };
    shellAbbrs = {
      c = "cd";
      g = "gl";
      stats = "btm";
    };
  };
}
