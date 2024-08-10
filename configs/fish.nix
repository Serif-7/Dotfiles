
{ config, ...}:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      bind -k nul -M insert 'accept-autosuggestion'
    '';

    shellAliases = {
      ls = "eza";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      grep = "rg";
      ping = "gping";
      ps = "procs";
      find = "fd";
      cat = "bat -p";
      stats = "bottom";
      # git = "gl";

      # default scan
      scan = "nmap -sC -sV -oA";
    };
  };
}
