
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
      rm = "mv $argv ~/.trash";
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
